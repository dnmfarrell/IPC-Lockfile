use strict;
use warnings;
package IPC::Lockfile;

# ABSTRACT: run only one instance of a program at a time using flock
use Fcntl qw(:flock);

# lexical filehandles dont work!
open our $LOCKFILE, '<', $0  or die "Unable to create the lockfile $0 $!\n";
flock $LOCKFILE, LOCK_EX|LOCK_NB or die "$0 is running!\n";

=head1 SYNOPSIS

Just import the module:

    #!/usr/bin/env perl
    use IPC::Lockfile;

    ... # program code here

This will open a lock on the program file, avoiding the need for an external
lockfile. This elegant L<solution|http://perl.plover.com/yak/flock/samples/slide006.html> for lockfiles was proposed by Mark Jason Dominus.

=head1 DESCRIPTION

C<IPC::Lockfile> is a module for use with Perl programs when you only want one
instance of the script to run at a time. It uses C<flock> and should work if
run on an OS that supports C<flock> (e.g. Linux, BSD, OSX and Windows).

=head1 SEE ALSO

L<IPC::Pidfile> for a PID-based solution that relies on signals and has a race
condition (not recommended).

=cut

1;
