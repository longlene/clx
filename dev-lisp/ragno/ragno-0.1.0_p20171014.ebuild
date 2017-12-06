# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ac1c4a0307fb9646e1044bdb665d4293d654d20a"

DESCRIPTION="Common Lisp Web crawling library based on Psychiq"
HOMEPAGE="https://github.com/fukamachi/ragno"
SRC_URI="https://github.com/fukamachi/ragno/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/psychiq
	dev-lisp/quri
	dev-lisp/dexador
	dev-lisp/alexandria
"
