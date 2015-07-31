package Dancer2::Plugin::LogContextual;

use strictures 2;

use Dancer2;
use Dancer2::Plugin;

use Dancer2::Plugin::AppRole::Helper;

# VERSION

# ABSTRACT: wrap a Dancer2 plack app in the configured Log::Contextual logger

# COPYRIGHT

=head1 SYNOPSIS

    use Dancer2;

    use Dancer2::Plugin::LogContextual;
    use Log::Contextual ':log';

    any '/' => sub {
        log_error "aaaah"; # logs via lc_logger below
    };

    set lc_logger => MyLCLogger->new;

    my $app = to_app; # the logger above will now be active for every route
                      # dispatched by this app and every function called
                      # therein

=cut

on_plugin_import { ensure_approle_s LogContextual => @_ };

register_plugin;

1;
