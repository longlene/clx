# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="68674729a232c0c31d404fe87ceef5cf1fea15a6"

DESCRIPTION="A tiny header-only C++ library for Sixel"
HOMEPAGE="https://github.com/ushitora-anqou/tinysixel"
SRC_URI="https://github.com/ushitora-anqou/tinysixel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins sixel.hpp
	dodoc README.md
}
