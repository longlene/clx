# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8eea08b678f57f5b72ce76de7effb4f279d2510f"

DESCRIPTION="Embeddable HTML templating engine for Common Lisp with JSX-like syntax"
HOMEPAGE="https://github.com/fukamachi/lsx"
SRC_URI="https://github.com/fukamachi/lsx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "lsx\/tests"/,$d' ${PN}.asd
		rm -r tests
	fi
}
