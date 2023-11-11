# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A hook facility for Common Lisp"
HOMEPAGE="https://github.com/atlas-engineer/nhooks"
SRC_URI="https://github.com/atlas-engineer/nhooks/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/serapeum
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "nhooks\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests.lisp
}
