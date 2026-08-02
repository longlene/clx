# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="61496210bbce6ecb655886d40412b6d64f6545b5"

inherit cmake

DESCRIPTION="Grapheme-aware, linear-time (ReDoS-safe), single-header C++17 regex engine"
HOMEPAGE="https://github.com/yhirose/cpp-regexlib"
SRC_URI="https://github.com/yhirose/cpp-regexlib/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/cpp-regexlib-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
