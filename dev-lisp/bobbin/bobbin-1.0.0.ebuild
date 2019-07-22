# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Bobbin wraps strings"
HOMEPAGE="https://github.com/sjl/bobbin"
SRC_URI="https://github.com/sjl/bobbin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
	test? ( dev-lisp/1am )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/asdf:defsystem :bobbin\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
