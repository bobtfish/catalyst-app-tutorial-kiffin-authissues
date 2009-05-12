use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'MyApp' }

{
    my $res = request('/');
    is( $res->code, 302, 'Request / redirect' );
    like( $res->header('Location'), qr/login/, 'redirect to /login');
}

