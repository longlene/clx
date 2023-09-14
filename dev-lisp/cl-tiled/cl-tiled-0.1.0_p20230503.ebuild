# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c48ebf75b918fc3a557c8823a965c28509379cea"

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
