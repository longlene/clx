# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2f2a289a3b123fb93aa7787967e6e063931501a6"

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
	dev-lisp/vom
	dev-lisp/quri
	dev-lisp/dexador
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
"
