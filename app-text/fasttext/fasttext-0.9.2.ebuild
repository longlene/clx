# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Library for efficient text classification and representation learning"
HOMEPAGE="https://fasttext.cc/"
SRC_URI="https://github.com/facebookresearch/fastText/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" CMakeLists.txt
	cmake_src_prepare
}
