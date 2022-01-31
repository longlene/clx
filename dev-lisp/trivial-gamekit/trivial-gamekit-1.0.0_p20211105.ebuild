# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2555cedca7c24b155feb0cb8daa79f142d062e16"

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
	dev-lisp/bodge-utilities
	dev-lisp/cl-bodge
	dev-lisp/cl-muth
	dev-lisp/cl-fad
	dev-lisp/doxy
	dev-lisp/alexandria
	dev-lisp/cl-mustache
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all assets
}
