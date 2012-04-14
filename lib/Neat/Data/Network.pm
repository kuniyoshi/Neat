package Neat::Data::Network;
use strict;
use warnings;
use base "Neat::Data";

__PACKAGE__->table( "network" );
__PACKAGE__->columns( Primary => "id" );
__PACKAGE__->columns( Others  => qw( address  cidr  note  created_at  updated_at ) );

1;

