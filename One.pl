#!/usr/bin/perl -w
 
use Net::Twitter;
use Scalar::Util 'blessed';
 
my $nt = Net::Twitter->new(
      traits                 => [qw/OAuth API::REST API::Search/],
      consumer_key           => "PZBzeiUFkzZ0vF4bNY88rQ",
      consumer_secret        => "2VjWny5UTCk4eIde6GBUFdRsCwiOX6jIgQCPmT6VA",
      access_token           => "349126638-MZ0fCAYRQnyarDjsph5sXtOZBF0h6TjbXjxUXHGn",
      access_token_secret    => "r0SyKoqU91uMksfXD8mTPOI9k0h1UkOkb5rH1LVJh8",
      ssl                    => '1',
      decode_html_entities   => '1',
);
 
eval {
      my $response = $nt->search("India");
 
      print
      $response->{'results'}->[$_]->{'created_at'}," - ",
      $response->{'results'}->[$_]->{'from_user'}," - ",
      $response->{'results'}->[$_]->{'text'}, "\n\n" foreach (1..10);
};
 
if ( my $err = $@ ) {
      print "12345";
      die $@ unless blessed $err && $err->isa('Net::Twitter::Error');
}
