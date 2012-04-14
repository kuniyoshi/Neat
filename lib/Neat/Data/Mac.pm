package Neat::Data::Mac;
use strict;
use warnings;
use base "Neat::Data";

__PACKAGE__->table( "mac" );
__PACKAGE__->columns( Primary => "id" );
__PACKAGE__->columns( Others  => qw( address  created_at  updated_at ) );

1;

