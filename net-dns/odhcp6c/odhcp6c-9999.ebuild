# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Embedded DHCPv6 client"
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://github.com/sbyx/${PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
}

