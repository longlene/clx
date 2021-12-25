# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a7a4452f6a670b8fb01a73d3007030d16bd1ec2c"

DESCRIPTION="Lisp Augmented Style Sheets"
HOMEPAGE="https://github.com/Shinmera/LASS"
SRC_URI="https://github.com/Shinmera/LASS/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-indent
	dev-lisp/trivial-mimes
	dev-lisp/cl-base64
"
