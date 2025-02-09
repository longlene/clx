# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f43344efe89cf9ce509e6ce4f7303ebb2ff14434"

DESCRIPTION="Bindings for sdl2_ttf using autowrap"
HOMEPAGE="https://github.com/Failproofshark/cl-sdl2-ttf"
SRC_URI="https://github.com/lem-project/cl-sdl2-ttf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/defpackage-plus
	dev-lisp/cl-autowrap
	dev-lisp/cl-sdl2
	dev-lisp/cffi
"

src_prepare() {
	default
	use example || rm -rf sdl2-ttf-examples.asd examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/spec
}
