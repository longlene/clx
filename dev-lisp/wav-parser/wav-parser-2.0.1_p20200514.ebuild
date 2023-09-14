# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3818d9f6437cec7aa516ff32b19a7c21584d82cf"

DESCRIPTION="Wav file format reader/writer"
HOMEPAGE="https://github.com/hyotang666/wav-parser"
SRC_URI="https://github.com/hyotang666/wav-parser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/r-iff
	dev-lisp/nibbles
	dev-lisp/local-time
	dev-lisp/static-vectors
	dev-lisp/trivial-garbage
"
BDEPEND=""
