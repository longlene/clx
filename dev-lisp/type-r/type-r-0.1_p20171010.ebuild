# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2cbf057b0070f64ceebffe0e52b2e4e7ad67f163"

DESCRIPTION="Collections of accessor functions and patterns to access the elements in a compound type specifier"
HOMEPAGE="https://github.com/guicho271828/type-r"
SRC_URI="https://github.com/guicho271828/type-r/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
"
