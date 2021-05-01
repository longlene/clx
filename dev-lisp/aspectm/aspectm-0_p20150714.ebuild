# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16a54ecc61e6df574daec4ab555261d44b1378e6"

DESCRIPTION="aspect-oriented hooks"
HOMEPAGE="https://github.com/guicho271828/aspectm"
SRC_URI="https://github.com/guicho271828/aspectm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/lisp-namespace
"

src_prepare() {
	default
	if ! use test ; then
		rm -r t aspectm.test.asd
	fi
}
