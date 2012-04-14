package Neat::Data::Ip;
use strict;
use warnings;
use base "Neat::Data";

__PACKAGE__->table( "ip" );
__PACKAGE__->columns( Primary => "id" );
__PACKAGE__->columns( Others  => qw( mac_id  network_id  address  version  created_at  updated_at ) );

1;

