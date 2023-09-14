# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Configuration management library for Common Lisp with profile support"
HOMEPAGE="https://github.com/sheepduke/chameleon/"
SRC_URI="https://github.com/sheepduke/chameleon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivia
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem chameleon\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
