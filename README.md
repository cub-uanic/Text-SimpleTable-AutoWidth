# NAME

Text::SimpleTable::AutoWidth - Text::SimpleTable::AutoWidth - Simple eyecandy ASCII tables with auto-width selection

# VERSION

version 0.09

# SYNOPSIS

    use Text::SimpleTable::AutoWidth;

    my $t1 = Text::SimpleTable::AutoWidth->new();
    $t1->row( 'foobarbaz', 'yadayadayada' );
    print $t1->draw;

    .-----------+--------------.
    | foobarbaz | yadayadayada |
    '-----------+--------------'


    my $t2 = Text::SimpleTable::AutoWidth->new();
    $t2->captions( 'Foo', 'Bar' );
    $t2->row( 'foobarbaz', 'yadayadayada' );
    $t2->row( 'barbarbarbarbar', 'yada' );
    print $t2->draw;

    .-----------------+--------------.
    | Foo             | Bar          |
    +-----------------+--------------+
    | foobarbaz       | yadayadayada |
    | barbarbarbarbar | yada         |
    '-----------------+--------------'

# DESCRIPTION

Simple eyecandy ASCII tables with auto-selection columns width,
as seen in [Catalyst](https://metacpan.org/pod/Catalyst).

# METHODS

## new(@attrs)

Inherited constructor from Moo.
You can set following attributes:

### fixed\_width

Set fixed width for resulting table. By default it's 0,
that's mean "don't fix width", so width of result table
will depend on input data.

Be warned, that fixed\_width will include not only width of your data,
but also all surronding characters, like spaces across values,
table drawings (like '|') and hypen (if wrapping is needed).

### max\_width

Set maximum width for resulting table. By default it's 0,
that's mean "use default value". Default value is stored in
$Text::SimpleTable::AutoWidth::WIDTH\_LIMIT, and can be changed
at any moment. Default value for WIDTH\_LIMIT is 200.

Be warned, that max\_width will include not only width of your data,
but also all surronding characters, like spaces across values,
table drawings (like '|') and hypen (if wrapping is needed).

NB: if you set fixed\_width and max\_width at same time, then you'll
get table with fixed width, but not wider than max\_width characters.

### captions

ArrayRef\[Str\] for captions in resulting table.

### rows

ArrayRef\[ArrayRef\[Str\]\] for values in each row.
You can use next method to add individual rows into table.

## row(@texts)

Add new row to table. Return $self, so you can write something like this:

    print Text::SimpleTable::AutoWidth
        ->new( max_width => 55, captions => [qw/ Name Age /] )
        ->row( 'Mother', 59 )
        ->row( 'Dad', 58 )
        ->row( 'me', 32 )
        ->draw();

## draw()

Draw table. Really, just calculate column width, and then call Text::SimpleTable->draw().

# GIT REPOSITORY

git clone git://github.com/cub-uanic/Text-SimpleTable-AutoWidth.git

# SEE ALSO

[Text::SimpleTable](https://metacpan.org/pod/Text::SimpleTable), [Moo](https://metacpan.org/pod/Moo), [Catalyst](https://metacpan.org/pod/Catalyst)

# AUTHOR

Oleg Kostyuk, `<cub#cpan.org>`

# COPYRIGHT & LICENSE

Copyright by Oleg Kostyuk.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

# AUTHOR

Oleg Kostyuk <cub.uanic@gmail.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Oleg Kostyuk.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
