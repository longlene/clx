# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="4cd89adfbc07cedada1aa32be12991828919d91b"

DESCRIPTION="C++ header-only linenoise-based readline library"
HOMEPAGE="https://github.com/yhirose/cpp-linenoise"
SRC_URI="https://github.com/yhirose/cpp-linenoise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins linenoise.hpp
	dodoc README.md
}
