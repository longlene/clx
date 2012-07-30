# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $

VIM_SPELL_LANGUAGE="Estonian"

inherit vim-spell

LICENSE="BSD LGPL-2.1 public-domain"
KEYWORDS="~alpha ~amd64 ~arm ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""
SRC_URI=""

DEPEND="app-dicts/myspell-et"

src_compile()
{
	cp ${ROOT}/usr/share/myspell/et_EE.{aff,dic} .
	# The command is mostly from the specfile of
	# http://rpm.pbone.net/index.php3/stat/3/srodzaj/2/search/vim-spell-et-1.0-1.src.rpm
	# "-T dumb" has been added for better overview if the compile process: for
	# the screen not to blank in the meantime.
	ewarn "To cancel the compilation, turn off Caps-Lock and type: Ctrl+C, Enter, Shift+Z, Shift+Q"
	vim -T dumb -u NONE -c 'set enc=utf-8' -c 'mkspell! et et_EE' -c q
}

