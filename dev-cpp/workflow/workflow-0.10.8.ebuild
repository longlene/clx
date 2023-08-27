# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ Parallel Computing and Asynchronous Networking Engine"
HOMEPAGE="https://github.com/sogou/workflow"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sogou/workflow"
else
	SRC_URI="https://github.com/sogou/workflow/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	dev-libs/openssl:0=
"
DEPEND="${RDEPEND}
	dev-cpp/gtest
"

src_prepare() {
	cmake_src_prepare
	mkdir docs/cn || die
	mv docs/*.md docs/cn || die
	sed -e '/DESTINATION "${CMAKE_INSTALL_DOCDIR}/{s#-${PROJECT_VERSION}##}' \
		-i CMakeLists.txt
}

src_install() {
	cmake_src_install
	dodoc -r docs/.
}
