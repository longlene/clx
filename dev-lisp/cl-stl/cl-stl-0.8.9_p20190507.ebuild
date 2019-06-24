# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="454335701bd3d24c325a534ca359d0dda247ab01"

DESCRIPTION="a port of C++ standard template library for Common Lisp"
HOMEPAGE="https://github.com/show-matz/CL-STL"
SRC_URI="https://github.com/show-matz/CL-STL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/cl-overload
	dev-lisp/cl-operator
"
BDEPEND=""
