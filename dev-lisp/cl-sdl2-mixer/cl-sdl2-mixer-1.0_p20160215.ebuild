# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc4a57208c9711c41b076a51be9bec77fc4696d5"

DESCRIPTION="SDL_mixer wrapper"
HOMEPAGE="https://github.com/lispgames/cl-sdl2-mixer"
SRC_URI="https://github.com/lispgames/cl-sdl2-mixer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	media-libs/sdl2-mixer
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/spec
}
