# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="c673bd802e84050d83cb977955550947dccf9aef"

DESCRIPTION="An alternative standard library for C++"
HOMEPAGE="https://github.com/higan-emu/nall"
SRC_URI="https://github.com/higan-emu/nall/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	insinto /usr/include/nall
	doins -r */ *.hpp
}
