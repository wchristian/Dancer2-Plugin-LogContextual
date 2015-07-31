package Dancer2::Plugin::AppRole::LogContextualWarn;

use strictures 2;

use Log::Contextual ':log';

use Moo::Role;

# VERSION

# ABSTRACT: role to force all warns in a Dancer2 plack app to log_warn

# COPYRIGHT

around to_app => sub {
    my ( $attr, $self, @args ) = @_;
    my $app = $self->$attr( @args );
    return sub {
        local $SIG{__WARN__} = sub {
            my @args = @_;
            log_warn { @args };
        };
        return $app->( @_ );
    };
};

1;
