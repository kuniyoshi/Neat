#!/usr/bin/perl
use 5.10.0;
use utf8;
use strict;
use warnings;
use open qw( :utf8 :std );
use Data::Dumper;
use DBI;

my $dbh = DBI->connect(
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

$dbh->do(<<SQL);
CREATE TABLE mac (
    id         INTEGER,
    address    CHAR(17),
    created_at CHAR(19),
    updated_at CHAR(19)
)
SQL

$dbh->do(<<SQL);
CREATE TABLE ip (
    id          INTEGER,
    mac_id      INTEGER,
    network_id  INTEGER,
    address     VARCHAR(39),
    version     INTEGER,
    created_at  CHAR(19),
    updated_at  CHAR(19)
)
SQL

$dbh->do(<<SQL);
CREATE TABLE network (
    id          INTEGER,
    address     CHAR(128),
    cidr        INTEGER,
    note        CHAR,
    created_at  CHAR(19),
    updated_at  CHAR(19)
)
SQL

$dbh->do(<<SQL);
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
SQL


