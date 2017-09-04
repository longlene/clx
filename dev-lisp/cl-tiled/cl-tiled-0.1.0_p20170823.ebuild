# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="82517f4dcfb07c545d776992ff53344a466f557b"

DESCRIPTION="Tiled map library for CL"
HOMEPAGE="https://github.com/Zulu-Inuoe/cl-tiled/"
SRC_URI="https://github.com/Zulu-Inuoe/cl-tiled/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/chipz
	dev-lisp/cl-base64
	dev-lisp/cl-json
	dev-lisp/nibbles
	dev-lisp/parse-float
	dev-lisp/split-sequence
	dev-lisp/uiop
	dev-lisp/xmls
"
