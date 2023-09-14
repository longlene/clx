# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple file manager written in bash"
HOMEPAGE="https://github.com/dylanaraps/fff"
SRC_URI="https://github.com/dylanaraps/fff/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin fff
	doman fff.1
	dodoc README.md
}
