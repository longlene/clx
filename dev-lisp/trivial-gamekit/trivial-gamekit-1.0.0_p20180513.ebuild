# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d5192641a43961a0d1506621d1b5396b286005f"

DESCRIPTION="Simplified interface to cl-bodge"
HOMEPAGE="https://github.com/borodust/trivial-gamekit"
SRC_URI="https://github.com/borodust/trivial-gamekit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/log4cl
	dev-lisp/cl-bodge
	dev-lisp/cl-muth
	dev-lisp/cl-fad
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all assets
}
