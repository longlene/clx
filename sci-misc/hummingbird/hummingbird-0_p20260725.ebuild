# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="988426271bc432e72f01715d868e0fc5a5ed0259"

DESCRIPTION="Zero-dependency C17 runtime for large open-source LLMs (dense + MoE)"
HOMEPAGE="https://github.com/prayangshuuu/hummingbird"
SRC_URI="https://github.com/prayangshuuu/hummingbird/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/hummingbird-${COMMIT}"

# Upstream's LICENSE file is a stated placeholder ("PLACEHOLDER LICENSE FILE
# -- Phase 4 bootstrap") declaring intent to release under Apache-2.0 but not
# yet containing the full license text or SPDX headers. Packaged on that
# stated intent; revisit once upstream finalizes it.
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="benchmarks examples test tools"
RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DHB_BUILD_TESTS=$(usex test)
		-DHB_BUILD_EXAMPLES=$(usex examples)
		-DHB_BUILD_TOOLS=$(usex tools)
		-DHB_BUILD_BENCHMARKS=$(usex benchmarks)
		-DHB_BUILD_FRONTENDS=ON
		-DHB_WARNINGS_AS_ERRORS=OFF
	)
	cmake_src_configure
}
