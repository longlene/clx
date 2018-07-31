# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Routing library taking advantage of the MOP"
HOMEPAGE="https://github.com/FungusHumungus/froute/"
SRC_URI="https://github.com/FungusHumungus/froute/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
	dev-lisp/hunchentoot
	test? ( dev-lisp/lisp-unit )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem :froute\/test/,$d' ${PN}.asd
		rm -r tests
	fi
}
