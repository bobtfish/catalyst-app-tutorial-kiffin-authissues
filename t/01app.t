use strict;
use warnings;
use Test::More tests => 20;
use HTTP::Request::Common;

BEGIN { use_ok 'Catalyst::Test', 'MyApp' }

use Data::Dump qw(dump);

{
    my $res = request('/');
    is( $res->code, 302, 'Request / redirect' );
    like( $res->header('Location'), qr/login/, 'redirect to /login');
}

ok( request('/login')->is_success, 'Can get /login' );

my %users = (
    test01 => 1,
    test02 => 0,
    test03 => 0,
);

foreach my $username (keys %users) {
    my $admin = $users{$username};
    my $cookie;
    {
        my $res = request(POST('/login', [ username => $username, password => 'mypass' ]));
        like($res->header('Location'), qr|/books/list|, 'redirect to /books/list on login');
        like($cookie = $res->header('Set-Cookie'), qr|myapp_session=|, 'Session cookie issued');
        is $res->code, 302, 'Is 302';
    }

    {
        my $req = GET('/books/list', Cookie => $cookie) ;
        my ($res, $ctx) = ctx_request( GET('/books/list', Cookie => $cookie) );
        like($res->content, qr|admin|, 'User is admin') if $admin;
        like($res->content, qr|user|, 'User is user');
    }

    {
        my $req = GET('/books/list', Cookie => $cookie) ;
        my ($res, $ctx) = ctx_request( GET('/books/form_create', Cookie => $cookie) );
        like($res->content, qr|Unauthorized|, 'User is authorized to create books') if !$admin;
        like($res->content, qr|form_create_do|, 'Can see create book form') if $admin;
    }
}

