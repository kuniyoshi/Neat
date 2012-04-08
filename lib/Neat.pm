package Neat;
use strict;
use warnings;
use MongoDB;
use Neat::Data::Mac;
use Neat::Data::Name;
use Neat::Data::Ip;

our $VERSION = "0.01";

sub new { bless { splice @_, 1 }, shift }

sub connection {
    my $self = shift;

    unless ( $self->{connection} ) {
        $self->{connection} = MongoDB::Connection->new;
    }

    return $self->{connection};
}

sub collection {
    my $self = shift;

    unless ( $self->{collection} ) {
        $self->{collection} = $self->connection->neat;
    }

    return $self->{collection};
}

sub insert {
    my $self    = shift;
    my $name    = shift;
    my $new_ref = shift;

    $self->collection->$name->insert( $new_ref );
}

sub find_one {
    my $self      = shift;
    my $name      = shift;
    my $query_ref = shift;

    my $document = $self->collection->$name->find_one( $query_ref )
        or return;

    return bless $document, sprintf "Neat::Data::%s", ucfirst $name;
}

sub update {
    my $self = shift;
    my $name = shift;
    my( $criteria_ref, $new_ref, $option_ref ) = @_;

    $self->collection->$name->update( $criteria_ref, $new_ref, $option_ref );
}

sub remove {
    my $self      = shift;
    my $name      = shift;
    my $query_ref = shift;

    $self->collection->$name->remove( $query_ref );
}


1;
__END__

=head1 NAME

Neat - recoed network setting.

=head1 SYNOPSIS

  use Neat;
  $neat = Neat->new;

  my $ip = $neat->ip_from_mac( "xx:xx:xx:xx:xx:xx" );
  my $ip = $neat->be_ip( "xxx.xxx.xxx.xxx" );
  my $ip = $neat->ip_from_name( "example.com" );

  say $ip->mac;
  say $ip->ip;
  say join " - ", $ip->names;

=head1 DESCRIPTION

Neat can record network configuration.

=head1 AUTHOR

kuniyoshi E<lt>kuniyoshi@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

