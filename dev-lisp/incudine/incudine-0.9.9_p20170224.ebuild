# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="641bfa00c73301fa7c9011f5f0a6844c218fa849"

DESCRIPTION="Music/DSP programming environment for Common Lisp"
HOMEPAGE="https://github.com/titola/incudine"
SRC_URI="https://github.com/titola/incudine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/swap-bytes
	dev-lisp/trivial-garbage
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING src/*.{h,c}
}
