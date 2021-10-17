# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="af585dbd1d444faafa370a73c1db43aece731f85"

DESCRIPTION="libubox http client library"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/uclient.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/ustream-ssl"

src_prepare() {
		default
		sed -i 's/-Werror //' CMakeLists.txt
}

