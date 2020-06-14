# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="93a7aa96f4ad2275d564a04bef7b3e8ce8e4b8b2"

DESCRIPTION="Lightweight, extremely high-performance JSON parser for C++11"
HOMEPAGE="https://github.com/chadaustin/sajson"
SRC_URI="https://github.com/chadaustin/sajson/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}
