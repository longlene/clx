# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="3b8746f5f79e28b504497624e3b363bab7462e39"

DESCRIPTION="C++11 libuv wrapper"
HOMEPAGE="https://github.com/larroy/uvpp"
SRC_URI="https://github.com/larroy/uvpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
"

src_install() {
	insinto /usr/include
	doins -r include/uvpp
	dodoc README.md
}
