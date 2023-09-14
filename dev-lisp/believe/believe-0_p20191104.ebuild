# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="98cf8689a75764ab485c78e82ba587cdd1c40c9e"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/luksamuk/believe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boehm-gc
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/clang/d' Makefile
}

src_install() {
	dobin believe
	dodoc README.org
}
