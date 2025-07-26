# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="58568621432715b0ed38efd16238b0e7ff36c3ba"

DESCRIPTION="A minimalistic C++ Jinja templating engine for LLM chat templates"
HOMEPAGE="https://github.com/google/minja"
SRC_URI="https://github.com/google/minja/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/system-dep.patch
)

src_configure() {
	local mycmakeargs=(
		-DMINJA_TEST_ENABLED=OFF
		-DMINJA_EXAMPLE_ENABLED=OFF
		-DMINJA_FUZZTEST_ENABLED=OFF
	)
	cmake_src_configure
}
