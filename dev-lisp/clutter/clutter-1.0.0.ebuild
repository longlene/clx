# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Annotations/decorators/attributes for CLOS classes and slots"
HOMEPAGE="https://github.com/alessiostalla/clutter/"
SRC_URI="https://github.com/alessiostalla/clutter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/doplus
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "clutter\/tests/,$d' ${PN}.asd
	rm -rf test
}
