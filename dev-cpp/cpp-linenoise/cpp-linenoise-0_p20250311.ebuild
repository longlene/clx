# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="5d2183e931eff05bc0d419a5eb84040a1d0af2c1"

DESCRIPTION="C++ header-only linenoise-based readline library"
HOMEPAGE="https://github.com/yhirose/cpp-linenoise"
SRC_URI="https://github.com/yhirose/cpp-linenoise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins linenoise.hpp
	dodoc README.md
}
