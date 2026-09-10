# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Jieba Chinese Word Segmentation Implemented By C++"
HOMEPAGE="https://github.com/yanyiwu/cppjieba"
SRC_URI="https://github.com/yanyiwu/cppjieba/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-cpp/limonp"
DEPEND="${RDEPEND}"

src_compile() {
	# Header-only library; src_install copies headers/dict straight from
	# source. The default emake would run the top-level Makefile's
	# "configure" target (cmake -S . -B build), which unconditionally
	# treats this as the top-level project and configures test/unittest,
	# which FetchContent_Declare()s googletest from GitHub -- unreachable
	# under the network sandbox. Nothing here needs building.
	:
}

src_install() {
	doheader -r include/cppjieba
	insinto /usr/share/cppjieba
	doins -r dict
	dodoc README.md
}
