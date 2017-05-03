# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="919821eec0ad483015a4a4b405518b3775c9b4ee"

DESCRIPTION="SDL_image wrapper"
HOMEPAGE="https://github.com/lispgames/cl-sdl2-image"
SRC_URI="https://github.com/lispgames/cl-sdl2-image/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/defpackage-plus
	dev-lisp/cl-autowrap
	dev-lisp/cl-sdl2
	media-libs/sdl2-image
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/spec
}
