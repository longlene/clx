# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="c0198f894f00aa025708f9a68d56d09accba6d8e"

DESCRIPTION="C++ 11 下优雅的事件驱动低耦合调度器/异步协程"
HOMEPAGE="https://github.com/FurryR/Awacorn"
SRC_URI="https://github.com/FurryR/Awacorn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/awacorn
	einstalldocs
}
