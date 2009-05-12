use strict;
use warnings;
use Test::More tests => 7;
use HTTP::Request::Common;

BEGIN { use_ok 'Catalyst::Test', 'MyApp' }

use Data::Dump qw(dump);

{
    my $res = request('/');
    is( $res->code, 302, 'Request / redirect' );
    like( $res->header('Location'), qr/login/, 'redirect to /login');
}

ok( request('/login')->is_success, 'Can get /login' );

{
    my $res = request(POST('/login', [ username => 'test01', password => 'mypass' ]));
    like($res->header('Location'), qr|/books/list|, 'redirect to /books/list on login');
    like($res->header('Set-Cookie'), qr|myapp_session=|, 'Session cookie issued');
    is $res->code, 302, 'Is 302';
}

