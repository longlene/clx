# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="c7424695eff81dd34c7a0614160492ce1b4f0c08"

DESCRIPTION="A dbg(...) macro for C++"
HOMEPAGE="https://github.com/sharkdp/dbg-macro"
SRC_URI="https://github.com/sharkdp/dbg-macro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins dbg.h
	dodoc README.md
}
