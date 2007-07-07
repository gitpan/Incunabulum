package Incunabulum;
#$Id: Incunabulum.pm 14 2007-07-07 03:35:33Z apeiron $

use strict;
use warnings FATAL => 'all';

use Incunabulum::Config;
use Incunabulum::Model;
use Incunabulum::View;
use Incunabulum::Controller;

use Apache2::Const -compile => qw(OK);

our $VERSION = '0.01';

sub handler
{
	my $config = {};
	Incunabulum::Model::get_wanted_conf_data($config);
	Incunabulum::View::get_wanted_conf_data($config);
	Incunabulum::Controller::get_wanted_conf_data($config);
	Incunabulum::Config::do_config($config);
	return Apache2::Const::OK;
}

no warnings 'void';
"I love you, Meaghan.";

__END__

=head1 NAME

Incunabulum - Extensible, plugin-based weblogging framework

=head1 SYNOPSIS

The most minimal Apache-enabled Incunabulum configuration:

	PerlPostConfigHandler Incunabulum
	<Location /incunabulum>
		SetHandler perl-script
		PerlResponseHandler Incunabulum::Controller::Plugin::mod_perl2
	</Location>

Other configurations are possible. See
L<Incunabulum::Docs::Admin|Incunabulum::Docs::Admin> for more possible
configurations.

=head1 DESCRIPTION

Incunabulum is both a lot of things and nothing at the same time. It provides an
API for developers to create weblog applications which are fully tailored to
their needs and desires. Incunabulum grants developers this freedom by providing
very little. On the most basic level, it's an MVC workflow. What this means is
that there's a very well-defined path through which control and data flow.  As
with any event-based framework, it entirely relies upon the developer to utilise
its functionality.

On its own, without any plugins (including the ones that ship with Incunabulum),
Incunabulum's functionality weighs in at zero. Hence, it's very easy to both
eschew and override the included functionality -- or to take the weblogging
system in entirely new directions. In not providing any functionality on its
own, Incunabulum doesn't force a developer to keep any module in order to
appease some internal API.

Frameworks are great things, and they serve as the bases for some of the most
powerful applications. In the Real World (tm), though, a framework is precisely
useless to an end user who just wants a drop-in that she can use to achieve some
ultimate, specific functionality. Hence, Incunabulum ships with a number of
plugin modules; these modules implement a basic weblog, accessible via a web
browser and hosted on a mod_perl-capable server. This weblog uses (by default) a
PostgreSQL database to store information and L<Text::Markdown|Text::Markdown> to
render documents. As stated above, Incunabulum's plugin-based nature allows for
the juxtapositioning of exterior data store / user interface modules. A user
shouldn't need to replace the PostgreSQL data store though, as all of the SQL is
standards-compliant and the DSN may be changed.

Incunabulum follows the B<MVC> design paradigm, which means that different parts
of the system are logically, programmatically, and physically separated. For
example, code in the Incunabulum::Model namespace knows nothing about HTML, just
as code in the Incunabulum::Controller namespace has very little knowledge about
how to handle database connections or authentication failures. And don't expect
anything in the Incunabulum::View namespace to know anything beyond some
geek-chic presentation languages (and some not-so-chic, but some people still
use RSS, so... :))

=head1 EXPORT

None. This will change when the external API is developed.

=head1 AUTHORS

Christopher Nehren, C<< <apeiron@cpan.org> >>

=head1 BUGS

Being that Incunabulum doesn't do anything right now, it doesn't have any
bugs whatsoever. :) Of course, that's bound to change once I start writing
code.

Please report any bugs or feature requests to
C<bug-incunabulum@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  We will be notified, and then you'll automatically
be notified of progress on your bug as we make changes.

=head1 ACKNOWLEDGEMENTS

I have to be honest. I never read acknowledgements sections in books or other
works. Primarily because I don't know any of the names or organisations, most of
the time. So B<writing> an acknowledgements section is definitely an interesting
experience for me. I'll do my best.

Incunabulum... wow. By its very nature it is firmly-rooted upon the shoulders of
a countlessly myriad, ever-growing populace of giants. First and foremost is
Simon Cozen's most wonderful Module::Pluggable::Ordered module, and by
induction, Simon Wistow's equally wonderful Module::Pluggable. Without these
modules, Incunabulum wouldn't exist. It's as simple as that. I couldn't have
ever, ever come up with the code to do what those modules do, not if I wanted
to. I owe so much to these two men that this may as well be their code.

It pains me to think of the kind of torture I'd endure if I tried to write
something this complex and flexible in a language other than Perl. I almost take
for granted the tremendous distilled wizardry and magic I use every time I use
something written in Perl. Incunabulum, by definition, requires the most
flexible programming language available to perform its task -- its possibilities
are limitless, just like Perl's. Larry Wall and everyone associated with the
development of Perl are not just in the language business; they're in the
business of wizardry. This neophyte humbly offers sincerest gratitude for
allowing him to partake of your wisdom, foresight, and just downright
awesomeness. Smashing good show.

Perl would not be what it is without its community. It's difficult to really
quantitatively describe the Perl culture; all I can really say is that it as a
whole is tremendously conducive and helpful in developing software like this, in
more ways than technical ones. I would say "thank you" to those aspects of the
community I visit regularly, but I know that they're influenced by all the
others. So, if you use Perl, and you interact with people regarding using
Perl... thank you! In some way or another, every person who reads this has
shaped the Perl community, and thus every person who reads this has my gratitude
for making Perl and its community what they are.

There are also people, very special and dear to me... people who've never done
anything with Perl in their lives. Yet that doesn't matter... and is perhaps
crucial to the roles they've played in my life. These people know who they are.
I consider myself thankful, blessed even, that they're too numerous to mention.
Sometimes, we may not have gotten along as well as I'd pleased... but
nonetheless know that each and every one of you has helped shape the person I am
today, and for that I am thankful to each and every one of you.

=head1 COPYRIGHT & LICENSE

Copyright 2004-2007 Christopher Nehren, All Rights Reserved.

This library is software. I'll determine a license for it eventually. For right
now, until that happens, assume it's public domain.

=cut
