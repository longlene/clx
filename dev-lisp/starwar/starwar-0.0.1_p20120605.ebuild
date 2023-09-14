# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="456e92663545e4a93f96abe53fee4d72487cf4a3"

DESCRIPTION="A game written in Common Lisp"
HOMEPAGE="https://github.com/xzpeter/starwar"
SRC_URI="https://github.com/xzpeter/starwar/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-ttf
	dev-lisp/lispbuilder-sdl-gfx
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all starwar.conf
}
