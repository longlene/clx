# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="c7b7c1011c2fc8c4f0dd2d7c40a626e9ce965e33"

DESCRIPTION="Convenient, high-performance RGB color and position control for console output"
HOMEPAGE="https://github.com/s9w/oof"
SRC_URI="https://github.com/s9w/oof/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins oof.h
	dodoc readme.md
}
