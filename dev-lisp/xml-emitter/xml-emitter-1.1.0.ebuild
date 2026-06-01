# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="An XML emitter"
HOMEPAGE="https://github.com/VitoVan/xml-emitter"
SRC_URI="https://github.com/VitoVan/xml-emitter/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-lisp/cl-utilities
"

src_prepare() {
	default
	sed -e '/defsystem :xml-emitter\/tests/,$d' \
		-i ${PN}.asd
	rm tests.lisp
}
