# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A tiny XCB floating window manager"
HOMEPAGE="https://github.com/mcpcpc/xwm"
SRC_URI="https://github.com/mcpcpc/xwm/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin xwm
	doman xwm.1
	dodoc README
}
