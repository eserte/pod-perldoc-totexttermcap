use strict;
use ExtUtils::MakeMaker;

my $is_devel_host = defined $ENV{USER} && $ENV{USER} eq 'eserte' && $^O =~ /bsd/i && -f "../../perl.release.mk";

WriteMakefile(
    NAME                => 'Pod::Perldoc::ToTextTermcap',
    AUTHOR              => 'Slaven Rezic <srezic@cpan.org>',
    VERSION_FROM        => 'lib/Pod/Perldoc/ToTextTermcap.pm',
    ABSTRACT_FROM       => 'lib/Pod/Perldoc/ToTextTermcap.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Pod::Perldoc::ToText'  => 0,
	'Pod::Text::Termcap'    => 0,
	'Pod::Text::Overstrike' => 0,
    },
    ($ExtUtils::MakeMaker::VERSION >= 6.54 ?
	(META_ADD => { resources => { repository => 'git://github.com/eserte/pod-perldoc-totexttermcap.git' } }) : ()),
);

sub MY::postamble {
    my $postamble = '';

    if ($is_devel_host) {
	$postamble .= <<'EOF';

.include "../../perl.release.mk"
.include "../../perl.cvs.mk"

EOF
    }

    $postamble;
}
