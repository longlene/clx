# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53327d6f10f2cd277660323d8fca3b9283fef7b4"

DESCRIPTION="A physics puzzle game prototype"
HOMEPAGE="https://github.com/smithzvk/Split-Shot"
SRC_URI="https://github.com/smithzvk/Split-Shot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/trivial-gamekit
"
BDEPEND=""
