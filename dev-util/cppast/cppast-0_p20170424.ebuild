# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="63c34e1ca36c5984a25dd6a09c8ba4adbaf0eda5"

DESCRIPTION="Library to parse and work with the C++ AST"
HOMEPAGE="https://github.com/foonathan/cppast"
SRC_URI="https://github.com/foonathan/cppast/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/cxxopts
	dev-cpp/tiny-process-library
	dev-cpp/type_safe
	dev-cpp/debug_assert
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/include(external/d' CMakeLists.txt
}
