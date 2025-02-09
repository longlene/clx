# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e122bb8ca22c8ba2e20afd13b7855addaadd7ac0"

DESCRIPTION="A Gnuplot front-end on Common lisp"
HOMEPAGE="https://github.com/masatoi/clgplot"
SRC_URI="https://github.com/masatoi/clgplot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/external-program
	dev-lisp/iterate
	sci-visualization/gnuplot
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
