# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="8d536f1698065f307152aedf96636277d4afb60a"

DESCRIPTION="The RaftLib C++ library"
HOMEPAGE="https://github.com/RaftLib/RaftLib/"
SRC_URI="https://github.com/RaftLib/RaftLib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/add_subdirectory/{/examples/d}' \
		-e '/add_subdirectory/{/benchmarks/d}' \
		-i CMakeLists.txt
}
