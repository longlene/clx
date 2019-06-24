# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="This is no official port of Haskell package Data.List"
HOMEPAGE="https://github.com/Dimercel/listopia"
SRC_URI="https://github.com/Dimercel/listopia/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use test || rm -r ${PN}-bench.asd bench ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
