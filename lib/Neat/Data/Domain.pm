package Neat::Data::Domain;
use strict;
use warnings;
use base "Neat::Data";

__PACKAGE__->table( "domain" );
__PACKAGE__->columns( Primary => "id" );
__PACKAGE__->columns( Others  => qw( name  type  class  data  ttl  created_at  updated_at ) );

1;

