# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e52bebb3a540478fe192c82951cccd20f7d07934"

DESCRIPTION="A simple Common Lisp wrapper to use speech analysis library WORLD"
HOMEPAGE="https://github.com/masatoi/cl-libworld"
SRC_URI="https://github.com/masatoi/cl-libworld/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/lake
	dev-lisp/uiop
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_compile() {
	emake -C lib/World
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
	exeinto ${CLSOURCEROOT}/${CLPACKAGE}/lib/World/build
	doexe lib/World/build/{audioio.so,libworld.so}
}
