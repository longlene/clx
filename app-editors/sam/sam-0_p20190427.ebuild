# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="5893679bbbab2f50ceb6ef0805e4bb63f5f51df8"

DESCRIPTION="An updated version of the sam text editor"
HOMEPAGE="https://github.com/deadpixi/sam"
SRC_URI="https://github.com/deadpixi/sam/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-base/xorg-x11
"
RDEPEND="${DEPEND}"
BDEPEND=""
