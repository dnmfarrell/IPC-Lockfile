use strict;
use warnings;
package IPC::Lockfile;

# ABSTRACT: run only one instance of a program at a time using flock
use Fcntl qw(:flock);

my $filepath = "$0.lock";

# lexical filehandles dont work!
open LOCKFILE, '>', $filepath
  or die "Unable to create the lockfile $filepath $!\n";
flock LOCKFILE, LOCK_EX|LOCK_NB or die "$0 is running!\n";;

=head1 SYNOPSIS

Just import the module:

    #!/usr/bin/env perl
    use IPC::Lockfile;

    ... # program code here

This will create a lockfile in the same directory as the program. To avoid
race conditions, the file will not be deleted when the program ends.

Or do not use this module and just add these lines to your program:

  use Fcntl qw(:flock);
  flock DATA, LOCK_EX|LOCK_NB or die "$0 is running!\n";;

  ... # program code goes here

  __DATA__

No external lockfile is created as it uses C<_DATA_>. An elegant L<solution|http://perl.plover.com/yak/flock/samples/slide006.html>
for lockfiles proposed by Mark Jason Dominus.

=head1 DESCRIPTION

C<IPC::Lockfile> is a module for use with Perl programs when you only want one
instance of the script to run at a time. It uses C<flock> and should work if
run on an OS that supports C<flock> (e.g. Linux, BSD, OSX and Windows).

=head1 SEE ALSO

L<IPC::Pidfile> for a PID-based solution that relies on signals and has a race
condition (not recommended).

=cut

1;
