use DBI;
use CGI 'param';
use JDBI::VType;
use JDBI::Access;
use JDBI::Base;
use JDBI::Admin;
use JDBI::OnEvents;
use JDBI::Object;
use JDBI::Array;
use Classes::User;
use Classes::UserGroup;
use StdModule;
use ModRoot;

package JDBI;
use strict qw(subs vars);
use Exporter;


###################################################################################################
# ������� ���������� ����������
###################################################################################################

our @EXPORT = ('url');
our @ISA = 'Exporter';

our $dbh;
our %dbo_cache;
our %vtypes;
our $cgi;
our @vtypes;
our @classes;
our @modules;

our $user;
our $group;


###################################################################################################
# ���������������� ������� ����������
###################################################################################################

sub init()
{
	$dbh = '';
	$cgi = '';
	%dbo_cache = ();
	%vtypes = ();
	@classes = ();
	@vtypes = ();
	@modules = ();
	$user = '';
	$group = '';
	
	$cgi = $JIO::cgi || CGI->new();
	
	my $cdir;
	my $file;
	
	#------------- Modules ------------------------------------------
	
	# �������� ���������� � �������.
	opendir($cdir,$JConfig::path_lib.'/Modules');
	while($file = readdir($cdir)){
		unless(-f $JConfig::path_lib.'/Modules/'.$file){ next; }
		unless($file =~ m/^\w+\.pm$/){ next; }
		
		$file =~ s/\.pm//g;
		push @modules, $file;
	}
	closedir($cdir);
	
	# �������� ������
	my $mod;
	for $mod (@modules){ require 'Modules/'.$mod.'.pm'; }
	#for $mod (@modules){ if($mod->can('onload')){ $mod->onload(); } }
	if($JConfig::debug){ for $mod (@modules){ $mod->check(); } }
	
	#------------- /Modules -----------------------------------------
	
	#------------- VTypes -------------------------------------------
	
	# �������� ���������� � ����������� �����.
	opendir($cdir,$JConfig::path_lib.'/JDBI/vtypes');
	while($file = readdir($cdir)){
		unless(-f $JConfig::path_lib.'/JDBI/vtypes/'.$file){ next; }
		unless($file =~ m/^\w+\.pm$/){ next; }
		
		$file =~ s/\.pm//g;
		push @vtypes, $file;
	}
	closedir($cdir);
	
	# �������� ����������� ����
	my $vt;
	for $vt (@vtypes){ require 'JDBI/vtypes/'.$vt.'.pm'; }
	
	#------------- /VTypes ------------------------------------------
	
	#------------- Classes ------------------------------------------
	
	# �������� ���������� � ��������� �������.
	opendir($cdir,$JConfig::path_lib.'/Classes');
	while($file = readdir($cdir)){
		unless(-f $JConfig::path_lib.'/Classes/'.$file){ next; }
		unless($file =~ m/^\w+\.pm$/){ next; }
		
		$file =~ s/\.pm//g;
		push @classes, $file;
	}
	closedir($cdir);
	
	# �������� ������
	my $class;
	for $class (@classes){ require 'Classes/'.$class.'.pm'; }
	#for $class (@classes){ if($class->can('onload')){ $class->onload(); } }
	if($JConfig::debug){ for $class (@classes){ $class->check(); } }
	
	#------------- /Classes ------------------------------------------
}

sub cache_save
{
	if($JConfig::autosave){
		my $to;
		for $to (values(%dbo_cache)){ $to->save(); }
	}
}

sub cache_clear
{
	cache_save();
	%dbo_cache = ();
}

sub destruct()
{
	cache_clear();
	
	$dbh->disconnect();
}

sub connect
{
	my $class = shift;
	my($dbd,$u,$p);
	
	if(@_){
		($dbd,$u,$p) = @_;
	}else{
		($dbd,$u,$p) = ($JConfig::mysql_base,$JConfig::mysql_user,$JConfig::mysql_pas);
	}
	
	$dbh = DBI->connect($dbd,$u,$p,{ RaiseError => 1 });
	$dbh->{'HandleError'} = \&JIO::err505;
}

sub dousers()
{
	if($JConfig::users_do_e){
		
		JIO::Users::su_start($JConfig::user_guest);
		JIO::Users->verif();
		
	}else{
		
		$user  = User->new();
		$user->{'ID'} = 1;
		$user->{'name'} = '����������� �����';
		
		$group = UserGroup->new();
		$group->{'ID'} = 1;
		$group->{'name'}	= '��������������';
		
		$group->{'html'}	= 1;
		$group->{'files'}   = 1;
		$group->{'cms'}	 = 1;
		$group->{'root'}	= 1;
		$group->{'cpanel'}  = 1;
	}
}


###################################################################################################
# ������� ������� ����������
###################################################################################################

sub print_props
{
	my $class = shift;
	my $key;
	my %p = $class->props();
	
	print '<table border=1>';
	
	print '<tr><td align=center colSpan=2><b>'.$class.'</b></td></tr>';
	
	for $key (keys( %p )){
		print '<tr><td>',$p{$key}{'name'},' (',$key,'):</td><td><b>',$p{$key}{'type'},'</b></td></tr>';
	}
	
	print '</table>';
	
	return '';
}

sub url($)
{
	my $url = shift;
	
	if($url eq '-info'){ JIO::stop(); print '���� ������ ������� �� ������ ����,\n�������������� �������� ������ ������������ (� JPEG).\n\n�������� ����:	EnJine\n������:		',$JCongif::version; return undef; }
	
	my ($class,$id) = url2classid($url);
	
	my $to = $class->new($id);
	
	return $to;
}

sub url2classid
{
	my $url = shift;
	
	my ($class,$id) = ('','');
	
	if( $url !~ m/^([A-Za-z]+)(\d+)$/ ){ JIO::err505('Invalid object requested: '.$url); }
	
	$class = $1;
	$id = $2;
	
	if( !JDBI::classOK($class) ){ JIO::err505('Invalid class name requested: '.$class); }
	
	return ($class,$id);
}

sub classOK
{
	my $cn = shift;
	my $i = '';
	
	for $i (@classes){ if($i eq $cn ){ return 1; } }
	for $i (@modules){ if($i eq $cn ){ return 1; } }
	
	if($cn eq 'ModRoot' ){ return 1; }
	
	return 0;
}

sub fromTIMESTAMP
{
	my $ts = shift;
	
	my $str = $JDBI::dbh->prepare('SELECT DATE_FORMAT(?,\'%d %M %Y �., %H:%i:%s\')');
	$str->execute($ts);
	
	my $date;
	($date) = $str->fetchrow_array();
	
	$date =~ s/^0//;
	
	$date =~ s/January/������/i;
	$date =~ s/February/�������/i;
	$date =~ s/March/�����/i;
	$date =~ s/April/������/i;
	$date =~ s/May/���/i;
	$date =~ s/June/����/i;
	$date =~ s/July/����/i;
	$date =~ s/August/�������/i;
	$date =~ s/September/��������/i;
	$date =~ s/October/�������/i;
	$date =~ s/November/������/i;
	$date =~ s/December/�������/i;
	
	return $date;
}

sub access_creTABLE
{
	my $sql = 'CREATE TABLE IF NOT EXISTS `access` ( '."\n";
	$sql .= '`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY , ';
	$sql .= '`url` VARCHAR(50) NOT NULL, ';
	$sql .= '`memb` VARCHAR(50) DEFAULT \'\' NOT NULL, ';
	$sql .= '`code` INT DEFAULT 0 NOT NULL, ';
	$sql .= 'INDEX ( `memb` ), INDEX ( `url` ) )';
	
	my $str = $JDBI::dbh->prepare($sql);
	return $str->execute();
}

sub purge_cache { %JDBI::dbo_cache = (); }

sub dump_cache
{
	my $obj;
	my $file;
	open($file,'>'.$JConfig::path_tmp.'/cache.html');
	print $file '<HTML><BODY><TITLE>���������� %JDBI::dbo_cache, ��� �������� � PID = ',$$,'</TITLE><TABLE border=1>';
	print $file '<TR><TD><b>url</d></TD><TD><b>name</b></TD><TD><b>addres</b></TD></TR>';
	for $obj (keys(%JDBI::dbo_cache)){
		print $file '<TR><TD>',$obj,'</TD><TD>',$JDBI::dbo_cache{$obj}->name(),'</TD><TD>',$JDBI::dbo_cache{$obj},'</TD></TR>';
	}
	print $file '</TABLE></BODY></HTML>';
	close($file);
}

sub HTMLfilter
{
	my $val = shift;
	
	$val =~ s/</&lt;/g;
	$val =~ s/>/&gt;/g;
	
	return $val;
}

sub MD5
{
	my $var = shift;
	
	my $str = $dbh->prepare('SELECT MD5(?)');
	$str->execute($var);
	
	my ($res) = $str->fetchrow_array();
	return $res;
}

###################################################################################################

return 1;



