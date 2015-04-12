# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="library for SSL over ustream"
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="git://nbd.name/${PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="polarssl +openssl"

RDEPEND="dev-libs/libubox
polarssl? ( net-libs/polarssl )
openssl? ( dev-libs/openssl )"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
}

