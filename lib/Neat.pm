package Neat;
use strict;
use warnings;

our $VERSION = "0.01";

sub new { bless { splice @_, 1 }, shift }

1;
__END__

=head1 NAME

Neat - recoed network setting.

=head1 SYNOPSIS

  use Neat;
  $neat = Neat->new;

=head1 DESCRIPTION

Neat can record network configuration.

=head1 DB SCHEMA

=head2 TABLES

=head3 CSV

=over

=item mac

  CREATE TABLE mac (
      id         INTEGER,
      address    CHAR(17),
      created_at CHAR(19),
      updated_at CHAR(19)
  )

=item ip

  CREATE TABLE ip (
      id          INTEGER,
      mac_id      INTEGER,
      network_id  INTEGER,
      address     VARCHAR(39),
      version     INTEGER,
      created_at CHAR(19),
      updated_at CHAR(19)
  )

=item network

  CREATE TABLE network (
      id          INTEGER,
      address     CHAR(128),
      cidr        INTEGER,
      note        CHAR,
      created_at  CHAR(19),
      updated_at  CHAR(19)
  )

=item domain

  CREATE TABLE domain (
      id         INTEGER,
      name       CHAR,
      type       INTEGER,
      class      INTEGER,
      data       CHAR,
      ttl        INTEGER,
      created_at CHAR(19),
      updated_at CHAR(19)
  )

=back

=head3 MySQL

Very sorry, those are for the future for me.  Please use CSV.

=over

=item mac

  CREATE TABLE mac (
      id          INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      address     CHAR(128)    NOT NULL,
      createstamp DATETIME     NOT NULL,
      timestamp   TIMESTAMP    NOT NULL,
      UNIQUE (`address`)
  );

=item ip

  CREATE TABLE ip (
      id          INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      mac_id      INT UNSIGNED NOT NULL,
      network_id  INT UNSIGNED NOT NULL,
      address     CHAR(128)    NOT NULL,
      version     TINYINT(1)   NOT NULL DEFAULT 4,
      createstamp DATETIME     NOT NULL,
      timestamp   TIMESTAMP    NOT NULL,
      KEY `version_address` (`version`, `address`),
      UNIQUE (`mac_id`),
      KEY (`network_id`)
  )

=item network

  CREATE TABLE network (
      id          INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      address     CHAR(128)    NOT NULL,
      cidr        INT UNSIGNED NOT NULL,
      note        TEXT         NOT NULL,
      createstamp DATETIME     NOT NULL,
      timestamp   TIMESTAMP    NOT NULL,
      KEY `address_cidr` (`address`, `cidr`)
  )

=item domain

  CREATE TABLE domain (
      id          INT UNSIGNED     NOT NULL PRIMARY KEY AUTO_INCREMENT,
      name        VARCHAR(255)     NOT NULL DEFAULT 'neat',
      type        TINYINT UNSIGNED NOT NULL DEFAULT 1,
      class       TINYINT UNSIGNED NOT NULL DEFAULT 1,
      data        VARCHAR(255)     NOT NULL,
      ttl         INT              NOT NULL,
      createstamp DATETIME         NOT NULL,
      timestamp   TIMESTAMP        NOT NULL,
      KEY `name` (`name`),
      KEY `type_class_data` (`type`, `class`, `data`)
  )

=item task

  CREATE TABLE task (
      id          INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      name        VARCHAR(255) NOT NULL,
      createstamp DATETIME     NOT NULL,
      timestamp   TIMESTAMP    NOT NULL
  )

=item job

  CREATE TABLE job (
      id          INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      task_id     INT UNSIGNED NOT NULL,
      name        VARCHAR(255) NOT NULL,
      params      TEXT         NOT NULL,
      createstamp DATETIME     NOT NULL,
      timestamp   TIMESTAMP    NOT NULL,
      KEY `task_id` (`task_id`)
  )

=back

=head1 AUTHOR

kuniyoshi E<lt>kuniyoshi@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

