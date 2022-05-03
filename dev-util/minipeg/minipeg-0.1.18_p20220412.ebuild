# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="43e436fe16dc8e3d18e15c03be8ff32124ff0f94"

DESCRIPTION="A C peg parser generator"
HOMEPAGE="https://github.com/andrewchambers/minipeg"
SRC_URI="https://github.com/andrewchambers/minipeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin minipeg
	doman doc/minipeg.1
	dodoc README.md
}
