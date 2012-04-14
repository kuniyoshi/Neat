package Neat::Data;
use strict;
use warnings;
use base "Class::DBI";
use Data::Dumper;
use Time::Piece ();

__PACKAGE__->connection(
    "dbi:CSV:",
    undef,
    undef,
    {
        f_dir        => "data.d",
        f_encoding   => "utf8",
        csv_eol      => "\n",
        csv_sep_char => "\t",
    },
);

__PACKAGE__->add_trigger(
    before_create => sub {
        my $self  = shift;
        my $class = ref $self;

        $self->created_at( $class->now->datetime );
        $self->updated_at( $class->now->datetime );
    },
);

__PACKAGE__->add_trigger(
    before_update => sub {
        my $self  = shift;
        my $class = ref $self;

        $self->updated_at( $class->now->datetime );
    },
);

sub now { Time::Piece::localtime }

sub dump { Data::Dumper->new( [ splice @_, 1 ] )->Terse( 1 )->Indent( 0 )->Sortkeys( 1 )->Dump }

1;

