package Neat::Data;
use strict;
use warnings;
use Time::Piece ( );
use JSON;

our $AUTOLOAD;

my $CODEC = JSON->new->utf8;

sub new { bless { }, shift }

sub AUTOLOAD {
    my $self = shift;
    ( my $method = $AUTOLOAD ) =~ s{ .* :: }{}msx;

    return $self->{ $method } if exists $self->{ $method };

    die "No method[$method] defined.";
}

sub DESTROY { }

sub oid { shift->{_id} }

sub createstamp {
    my $self = shift;
    my $oid  = $self->{_id};
    return Time::Piece::localtime( $oid->get_time );
}

sub as_hashref {
    my $self  = shift;
    my %clone = %{ $self };
    delete $clone{_id};
    return \%clone;
}

1;

