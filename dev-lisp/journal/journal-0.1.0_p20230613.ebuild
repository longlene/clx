# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0c81b2877e41c4b24ff2764d19857c16cd1670da"

DESCRIPTION="A Common Lisp library for logging, tracing, testing and persistence"
HOMEPAGE="https://github.com/melisgl/journal"
SRC_URI="https://github.com/melisgl/journal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/mgl-pax
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/osicat
	dev-lisp/local-time
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :journal\/test/,$d' ${PN}.asd
}
