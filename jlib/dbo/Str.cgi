package Str;

$name = '������';
@ISA = 'DBObject';

sub props
{
	my %props = (

		url	=> { type => string, length => 100, name => '����� � ���������' }
	);

	return %props;
}

sub new
{
	my $o = {};
	bless($o);

	$o->{PROPS} = %props;
	$o->_construct(@_);

	return $o;
}

sub name {
	my $o = shift;
	return $o->{url}?$o->{url}:$o->SUPER::name();
}

sub DESTROY
{
	my $o = shift;
	$o->SUPER::DESTROY();
}

return 1;