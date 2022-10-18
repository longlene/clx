# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="4c7b720b9c63b826fb9404e454ae54f2ef5649d5"

DESCRIPTION="OpenWrt core utilities"
HOMEPAGE="https://git.openwrt.org/?p=project/ubox.git"
SRC_URI="https://git.openwrt.org/?p=project/ubox.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
