# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="22a6ef98e97ced7f4fc14be468e6b853538abca3"

DESCRIPTION="Common Lisp FFI for SDL2"
HOMEPAGE="https://github.com/hu-dwim/hu.dwim.sdl"
SRC_URI="https://github.com/hu-dwim/hu.dwim.sdl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/hu_dwim_asdf
	dev-lisp/hu_dwim_syntax-sugar
	media-libs/libsdl2
	media-libs/sdl2-gfx
	media-libs/sdl2-ttf
	media-libs/sdl2-image
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all c2ffi-spec
}
