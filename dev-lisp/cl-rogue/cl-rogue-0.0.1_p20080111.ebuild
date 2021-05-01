# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3f429aa2753018a11924b135a318cefe50d2f75c"

DESCRIPTION="Classic Rogue in Common Lisp"
HOMEPAGE="https://github.com/JacobGabrielson/cl-rogue"
SRC_URI="https://github.com/JacobGabrielson/cl-rogue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ncurses
"
