# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A customizer for common lisp dynamic variables"
HOMEPAGE="https://github.com/szos/defconfig/"
SRC_URI="https://github.com/szos/defconfig/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-cltl2
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:defconfig\/tests/,$d' ${PN}.asd
	rm -rf tests
}
