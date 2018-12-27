# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="876c7f5bfb9b13d48e6d7960dd114082a0a95a6d"

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
