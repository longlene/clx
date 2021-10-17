# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="9d74f9f930117cbc7f8ee3566380dc290328dbba"

DESCRIPTION="Simple and portable GUI library in C"
HOMEPAGE="https://github.com/andlabs/libui"
SRC_URI="https://github.com/andlabs/libui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins ui.h ui_unix.h
	dolib.so ${CMAKE_BUILD_DIR}/out/libui.so*
	dodoc README.md
}
