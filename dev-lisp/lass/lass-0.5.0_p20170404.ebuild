# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7709927e41b4657348e4458e011f2f16162f49b8"

DESCRIPTION="Lisp Augmented Style Sheets"
HOMEPAGE="https://github.com/Shinmera/LASS"
SRC_URI="https://github.com/Shinmera/LASS/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-indent
	dev-lisp/trivial-mimes
	dev-lisp/cl-base64
"
