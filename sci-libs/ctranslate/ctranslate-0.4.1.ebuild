# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="OpenNMT C++ translator"
HOMEPAGE="https://github.com/OpenNMT/CTranslate"
SRC_URI="https://github.com/OpenNMT/CTranslate/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/eigen
	sci-libs/tokenizer
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/add_subdirectory(lib\/tokenizer/d' CMakeLists.txt
}
