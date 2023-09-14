# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="699fccb6727027343bb5fca69162a3113996edfc"

DESCRIPTION="Provides LISP-N --- extensible namespaces in Common Lisp"
HOMEPAGE="https://github.com/guicho271828/lisp-namespace"
SRC_URI="https://github.com/guicho271828/lisp-namespace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

src_prepare() {
	default
	use test || rm -rf t ${PN}.test.asd
}
