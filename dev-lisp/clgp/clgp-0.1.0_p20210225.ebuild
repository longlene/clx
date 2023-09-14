# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a1615adb93374fb960c3aa4469922473d5abfc49"

DESCRIPTION="CLOS based Common Lisp frontend of gnuplot"
HOMEPAGE="https://github.com/masatoi/clgp"
SRC_URI="https://github.com/masatoi/clgp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/uuid
	sci-visualization/gnuplot
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "clgp\/tests/,$d' ${PN}.asd
	rm -r tests
}
