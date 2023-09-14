# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Damn OPTion parsing library"
HOMEPAGE="https://github.com/sjl/adopt/"
SRC_URI="https://github.com/sjl/adopt/archive/v1.0.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bobbin
	dev-lisp/split-sequence
	test? ( dev-lisp/1am )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/asdf:defsystem :adopt\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
