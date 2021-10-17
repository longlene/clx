# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="4df34a4d0d5183135217fc8280faae8e697147bc"

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
