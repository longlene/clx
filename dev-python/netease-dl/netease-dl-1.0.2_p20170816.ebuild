# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 )
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="17f87ba6fb6ce13a8f61931c190112dbffbb319e"

DESCRIPTION="一个基于命令行的网易云音乐下载器"
HOMEPAGE="https://github.com/ziwenxie/netease-dl"
SRC_URI="https://github.com/ziwenxie/netease-dl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
