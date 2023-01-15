# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3074765101e41222b6b624a66aaf1e6416379f9c"

DESCRIPTION="Parse a floating point value from a string in Common Lisp"
HOMEPAGE="https://github.com/soemraws/parse-float"
SRC_URI="https://github.com/soemraws/parse-float/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

src_prepare() {
	default
	sed -e '/defsystem #:parse-float-tests/,$d' \
		-i ${PN}.asd
	rm ${PN}-tests.lisp
}
