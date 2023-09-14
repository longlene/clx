# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ac934187e6896d55982cab48f3fe2c1d3b934525"

DESCRIPTION="Numerical Array for Common Lisp"
HOMEPAGE="https://github.com/physcrf/narray"
SRC_URI="https://github.com/physcrf/narray/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/utility
	dev-lisp/complex
	dev-lisp/cl-ppcre
"
BDEPEND=""
