# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="Guile pipe macros for functional chaining, similar to the UNIX pipe \"|\" operator"
HOMEPAGE="https://github.com/joshwalters/guile-pipe"
SRC_URI=""

EGIT_REPO_URI="https://github.com/joshwalters/guile-pipe.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-scheme/guile"
RDEPEND="${DEPEND}"

src_install() {
	local mysitedir=$(guile -c '(display (%site-dir))')
	insinto $mysitedir
	doins src/pipe.scm
	dodoc README.md
}
