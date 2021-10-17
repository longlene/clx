# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="8970ce0d53a8ab55e4f27a6b73e50019a00ffb8f"

DESCRIPTION="Small-Fast-Embeddable GUI library"
HOMEPAGE="https://github.com/idea4good/GuiLite"
SRC_URI="https://github.com/idea4good/GuiLite/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/execute_process/d' \
		-e '/ADD_LIBRARY/{s#STATIC#SHARED#}' \
		-i CMakeLists.txt
}

src_install() {
	dolib.so libGuiLite.so

	insinto /usr/include/GuiLite/core
	doins -r core_include/*

	insinto /usr/include/GuiLite/widgets
	doins -r widgets_include/*

	dodoc README*.md
}
