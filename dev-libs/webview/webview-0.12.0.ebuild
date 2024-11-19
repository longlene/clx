# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Tiny cross-platform webview library for C/C++/Golang"
HOMEPAGE="https://github.com/webview/webview"
SRC_URI="https://github.com/webview/webview/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/webkit-gtk:4
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWEBVIEW_BUILD=ON
		-DWEBVIEW_INSTALL_TARGETS=ON
	)
	cmake_src_configure
}
