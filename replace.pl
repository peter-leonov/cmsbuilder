use File::Find;
use strict;

my @exts = qw/cgi pl pm/;

print 'Clearing...';

print "\n\n";

my $out = '';
my $fcnt = 0;
my $str = '';
my $pat = '(\.'.join('$)|(\.',@exts).'$)';
print $pat;
sub p
{
	if($_ !~ m/$pat/oi){ next; }
	
	my $f;
	
	open($f,'<',$_);
	binmode($f);
	$str = join('',<$f>);
	close($f);
	
	return unless $str =~ s/use strict;/use strict;/;
	
	open($f,'>',$_);
	binmode($f);
	print $f $str;
	close($f);
	
	$fcnt++;
	print $_,"\n";
}

find(\&p,'.');


print "\n\n\nFiles: $fcnt;\nDONE";
my $x = <STDIN>;