# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="libubox http client library"
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="git://git.openwrt.org/project/uclient.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/ustream-ssl"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
#	sed -i '/PKG_CHECK_MODULES/ s|json-c json|json-c|' CMakeLists.txt
}

