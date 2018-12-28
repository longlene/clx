# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="3ba74ebc9363993ea2a83fd73b4c1b1a96e73940"

DESCRIPTION="libubox http client library"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/uclient.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/ustream-ssl"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
#	sed -i '/PKG_CHECK_MODULES/ s|json-c json|json-c|' CMakeLists.txt
}

