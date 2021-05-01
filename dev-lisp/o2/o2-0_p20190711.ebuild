# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c162fc574e609a664d64d66e5f138d7592d0632c"

DESCRIPTION="2D shooter about war behind enemy lines"
HOMEPAGE="https://github.com/pkulev/o2"
SRC_URI="https://github.com/pkulev/o2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/cl-sdl2-image
	dev-lisp/cl-sdl2-ttf
	dev-lisp/local-time
	dev-lisp/bodge-chipmunk
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all res
	dodoc -r docs
}
