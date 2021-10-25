# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="29f2b42b248785acae3d05d5dd97a4e9ad0d8ecb"

DESCRIPTION="image manipulation library for Common Lisp"
HOMEPAGE="https://common-lisp.net/project/imago"
SRC_URI="https://github.com/tokenrove/imago/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zlib
	dev-lisp/cl-jpeg
	dev-lisp/alexandria
	dev-lisp/array-operations
"
