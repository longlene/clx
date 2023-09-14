# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f71a2ce9b2cfa295f2db4e17446935f9136b0b1"

DESCRIPTION="Diagram Make Language for Common Lisp"
HOMEPAGE="https://github.com/cuichaox/dml"
SRC_URI="https://github.com/cuichaox/dml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/donuts
	dev-lisp/cl-cairo2
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	rm -r demo
}
