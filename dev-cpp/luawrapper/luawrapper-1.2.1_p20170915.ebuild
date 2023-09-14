# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="4ec3f7e04647c40f50c60fc8b3553ec8836ca356"

DESCRIPTION="Easy-to-use lua wrapper for C++"
HOMEPAGE="https://github.com/ahupowerdns/luawrapper"
SRC_URI="https://github.com/ahupowerdns/luawrapper/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins include/LuaContext.hpp
	dodoc README.md
}
