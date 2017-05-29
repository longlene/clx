# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="9d376ade2275684b34862233c504a06e7391767b"

DESCRIPTION="Build a standalone executable from a Lua program"
HOMEPAGE="https://github.com/ers35/luastatic"
SRC_URI="https://github.com/ers35/luastatic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	newbin luastatic.lua luastatic
	dodoc readme.md
}
