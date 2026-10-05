# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="b0e8b88f53be0de26252180b1b959c6dd67ec4a9"

DESCRIPTION="C++ header-only linenoise-based readline library"
HOMEPAGE="https://github.com/yhirose/cpp-linenoise"
SRC_URI="https://github.com/yhirose/cpp-linenoise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins linenoise.hpp
	dodoc README.md
}
