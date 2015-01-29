use strict;
use warnings;
use inc::Module::Install;
use Module::Install::AuthorTests;
use Module::Install::AuthorRequires;

license 'perl';

name 'Text-SimpleTable-AutoWidth';
all_from 'lib/Text/SimpleTable/AutoWidth.pm';
author q{Oleg Kostyuk <cub@cpan.org>};

requires 'Moo'               => '1.00';
requires 'Text::SimpleTable' => '0.03';

test_requires 'Test::More';

author_requires 'Test::EOL' => '0.3';
author_requires 'Test::NoTabs';
author_requires 'Test::Pod'           => '1.14';
author_requires 'Test::Pod::Coverage' => '1.08';

resources repository => 'git://github.com/cub-uanic/Text-SimpleTable-AutoWidth.git';

tests 't/*.t';
author_tests 't/author';

if ($Module::Install::AUTHOR) {
    system('pod2text lib/Text/SimpleTable/AutoWidth.pm > README') and die $!;
}

WriteAll;

