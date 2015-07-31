package Dancer2::Plugin::AppRole::LogContextual;

use strictures 2;

use Log::Contextual 'with_logger';

use Moo::Role;

# VERSION

# ABSTRACT: role to wrap a Dancer2 plack app in the configured Log::Contextual logger

# COPYRIGHT

around to_app => sub {
    my ( $attr, $self, @args ) = @_;
    my $app = $self->$attr( @args );
    return sub {
        my @app_args = @_;
        my $logger   = $self->setting( "lc_logger" );
        return $logger
          ? with_logger $logger => sub { $app->( @app_args ) }
          : $app->( @app_args );
    };
};

1;
