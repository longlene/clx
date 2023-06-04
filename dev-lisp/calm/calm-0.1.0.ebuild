# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Canvas Aided Lisp Magic"
HOMEPAGE="https://github.com/VitoVan/calm"
SRC_URI="https://github.com/VitoVan/calm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/cl-sdl2-mixer
	dev-lisp/cl-sdl2-image
	dev-lisp/str
	dev-lisp/bt-semaphore
	dev-lisp/cl-cairo2
	dev-lisp/cl-gobject-introspection
"
BDEPEND=""
