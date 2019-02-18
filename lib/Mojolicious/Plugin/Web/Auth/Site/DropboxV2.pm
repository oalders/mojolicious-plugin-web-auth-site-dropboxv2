use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::DropboxV2;
use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has access_token_url => 'https://api.dropboxapi.com/oauth2/token';
has authorize_url    => 'https://www.dropbox.com/oauth2/authorize';
has response_type    => 'code';
has grant_type       => 'authorization_code';

sub moniker { 'dropboxv2' }

1;
__END__

# ABSTRACT: Dropbox OAuth2 Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    my $client_id     = '9999';
    my $client_secret = 'seekrit';

    # Mojolicious
    $self->plugin(
        'Web::Auth',
        module           => 'DropboxV2',
        key              => $client_id,
        secret           => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...;
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module      => 'DropboxV2',
        key         => $client_id,
        secret      => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
        my ( $c, $access_token, $access_secret ) = @_;
        ...;
        };

=head1 DESCRIPTION

This module adds
L<Dropbox|https://www.dropbox.com/developers/reference/oauth-guide> OAuth2
support to L<Mojolicious::Plugin::Web::Auth>.

=cut
