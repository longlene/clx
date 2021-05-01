# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="14d27dddf7162c4783e184a7bd4044b37b2d5945"

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
