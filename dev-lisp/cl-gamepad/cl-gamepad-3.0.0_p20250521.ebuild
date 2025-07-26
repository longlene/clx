# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="d37e7ca641599ffea348dcb6f7f5e3a21b7ad3da"

DESCRIPTION="Portability library for gamepad and joystick access"
HOMEPAGE="https://github.com/Shirakumo/cl-gamepad"
SRC_URI="https://github.com/Shirakumo/cl-gamepad/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/deploy
	dev-lisp/cffi
	dev-lisp/documentation-utils
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
