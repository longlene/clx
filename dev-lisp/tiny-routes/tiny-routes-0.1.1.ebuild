# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A tiny routing library for Common Lisp targeting clack"
HOMEPAGE="https://github.com/jeko2000/tiny-routes/"
SRC_URI="https://github.com/jeko2000/tiny-routes/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :tiny-routes\/test/,$d' ${PN}.asd
	rm -rf t
}
