﻿# CMSBuilder © Леонов П. А., 2005-2006

package modUsers::Login;
use strict qw(subs vars);
use utf8;

use CMSBuilder;
use modUsers::API;
import CGI 'param';

sub act
{
	my $c = shift;
	
	my $href	= shift || $CMSBuilder::Config::http_aroot.'/';
	my $act		= param('act');
	my $login	= param('login');
	my $pas		= param('pas');
	
	if($act eq 'in')
	{
		if(modUsers::API->login($login,$pas))
		{
			print '<script>location.href = "',$href,'"</script>';
		}
		else
		{
			print '<p class="message_error"><span class="head">Ошибка!</span> ',modUsers::API->last_error(),'</p>';
		}
	}
	
	if($act eq 'out')
	{
		if(modUsers::API->logout())
		{
			print '<script>location.href = "/"</script>';
		}
		else
		{
			print '<p class="message_error"><span class="head">Ошибка!</span> ',modUsers::API->last_error(),'</p>';
		}
	}
	
}

sub list
{
	unless($CMSBuilder::Config::users_login_list){return;}
	
	my $mod_name = $_[1] || 'modUsers::modUsers1';
	
	acs_off
	{
		print '<table><tr><td><p align="left">Система находится в тестовом режиме.<br> Выберите пользователя:</p>';
		
		my $modu = cmsb_url($mod_name);
		
		print $modu->name(),':<blockquote>';
		
		my $gurl = cmsb_url($CMSBuilder::Config::user_guest)->papa->myurl;
		
		for my $g ($modu->get_all())
		{
			if($g->myurl eq $gurl){ next; }
			unless($g->len()){ next; }
			
			print '<div><b>',$g->name(),'</b></div><blockquote>';
			
			for my $u ($g->get_all())
			{
				unless($u->{'login'}){next;}
				print '<a href="?act=in&login=',$u->{'login'},'&pas=*">',$u->name(),'</a><br>';
			}
			
			print '</blockquote>';
		}
		
		print '</blockquote></td></tr></table>';
	}
}


1;