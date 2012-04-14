package Neat::Config;
use strict;
use warnings;
use base "Class::Singleton";
use Carp qw/croak/;

our $AUTOLOAD;

sub _new_instance {
    my $class      = shift;
    my $env        = $ENV{NEAT_CONFIG} || require "/etc/Neat.conf";
    my $config_ref = require "/etc/Neat.$env.pl";
    return bless $config_ref, $class;
}

sub AUTOLOAD {
    my $self = shift;
    (my $attr = $AUTOLOAD) =~ s{.*::}{};

    croak "No $attr exists" unless exists $self->{$attr};

    no strict "refs";
    *{sprintf "%s::%s", ref($self), $attr} = sub { shift->{$attr} };

    return $self->$attr;
}

sub DESTROY { }

1;

