use strict;
use warnings;
package IPC::Lockfile;

# ABSTRACT: run only one instance of a program at a time using flock
use Fcntl qw(:flock);

flock DATA, LOCK_EX|LOCK_NB or die "$0 is running!\n";;

=head1 SYNOPSIS

Just import the module:

    #!/usr/bin/env perl
    use IPC::Lockfile;

    ... # program code here

No external lockfile is created, C<IPC::Lockfile> uses C<_DATA_> (See L<#THANKS>).

=head1 DESCRIPTION

C<IPC::Lockfile> is a module for use with Perl programs when you only want one
instance of the script to run at a time. It uses C<flock> and should work if
run on an OS that supports C<flock> (e.g. Linux, BSD, OSX and Windows).

=head1 THANKS

This module implements an elegant L<solution|http://perl.plover.com/yak/flock/samples/slide006.html> to lockfiles proposed by Mark Jason Dominus.

=head1 SEE ALSO

L<IPC::Pidfile> for a PID-based solution that relies on signals and has a race
condition (not recommended).

=cut

1;
__DATA__
