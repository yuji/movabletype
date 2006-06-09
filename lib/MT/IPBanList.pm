# Copyright 2001-2006 Six Apart. This code cannot be redistributed without
# permission from www.sixapart.com.  For more information, consult your
# Movable Type license.
#
# $Id$

package MT::IPBanList;
use strict;

use MT::Object;
@MT::IPBanList::ISA = qw( MT::Object );
__PACKAGE__->install_properties({
    column_defs => {
        'id' => 'integer not null auto_increment',
        'blog_id' => 'integer not null',
        'ip' => 'string(15) not null',
    },
    indexes => {
        blog_id => 1,
        ip => 1,
    },
    audit => 1,
    datasource => 'ipbanlist',
    primary_key => 'id',
});

sub ban_ip {
    my $class = shift;
    my ($ip, $blog_id) = @_;
    $class->set_by_key({ip => $ip, blog_id => $blog_id});
}


1;
__END__

=head1 NAME

MT::IPBanList - Movable Type IP comment banning record

=head1 SYNOPSIS

    use MT::IPBanList;
    my $ban = MT::IPBanList->new;
    $ban->blog_id($blog->id);
    $ban->ip($ip_address);
    $ban->save
        or die $ban->errstr;

=head1 DESCRIPTION

An I<MT::IPBanList> object represents a single IP address that is banned from
commenting on one of your blogs.

=head1 USAGE

As a subclass of I<MT::Object>, I<MT::IPBanList> inherits all of the
data-management and -storage methods from that class; thus you should look
at the I<MT::Object> documentation for details about creating a new object,
loading an existing object, saving an object, etc.

=head1 DATA ACCESS METHODS

The I<MT::BanList> object holds the following pieces of data. These fields can
be accessed and set using the standard data access methods described in the
I<MT::Object> documentation.

=over 4

=item * id

The numeric ID of the banlist record.

=item * blog_id

The numeric ID of the blog for which the IP address is banned.

=item * ip

The IP address. This can be a partial IP address--for example, a partial
address of C<10.100> will block the IP addresses C<10.100.2.1>,
C<10.100.100.3>, etc.

=back

=head1 DATA LOOKUP

In addition to numeric ID lookup, you can look up or sort records by any
combination of the following fields. See the I<load> documentation in
I<MT::Object> for more information.

=over 4

=item * blog_id

=item * ip

=back

=head1 AUTHOR & COPYRIGHTS

Please see the I<MT> manpage for author, copyright, and license information.

=cut
