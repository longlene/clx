# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7594077599179335481dfdebbe91f6605e8002a7"

DESCRIPTION="Bindings for sdl2_ttf using autowrap"
HOMEPAGE="https://github.com/Failproofshark/cl-sdl2-ttf"
SRC_URI="https://github.com/Failproofshark/cl-sdl2-ttf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	eapply_user
	use example || rm -rf sdl2-ttf-examples.asd examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/spec
}
