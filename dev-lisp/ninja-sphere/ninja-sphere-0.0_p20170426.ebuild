# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f6708d9ab209a831c7e7df3f12d32ecc4afe0426"

DESCRIPTION="Ninja Sphere"
HOMEPAGE="https://github.com/rpav/ninja-sphere"
SRC_URI="https://github.com/rpav/ninja-sphere/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/defpackage-plus
	dev-lisp/sdl2kit
	dev-lisp/cl-gamekernel
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all assets
}
