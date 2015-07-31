package Dancer2::Plugin::LogContextualWarn;

use strictures 2;

use Dancer2;
use Dancer2::Plugin;

use Dancer2::Plugin::AppRole::Helper;

# VERSION

# ABSTRACT: force all warns in a Dancer2 plack app to log_warn

# COPYRIGHT

=head1 SYNOPSIS

    use Dancer2;

    use Dancer2::Plugin::LogContextual; # not needed if you bring your own L::C
    set lc_logger => MyLCLogger->new;

    use Dancer2::Plugin::LogContextualWarn;

    any '/' => sub {
        warn "aaaah"; # logs via L::C's log_warn (and so will every warn in
                      # the local() scope)
    };


=cut

on_plugin_import { ensure_approle_s LogContextualWarn => @_ };

register_plugin;

1;
