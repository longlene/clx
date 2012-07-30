# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV=${PV/./}

MOD_DESC="enhances multiplayer options for both clients and servers"
MOD_NAME="Enhanced Militarized Zone"
MOD_DIR="emz"

inherit games games-mods

HOMEPAGE="http://www.the-emz.com/"
SRC_URI="http://www.the-emz.com/download/the-emz-d3-${MY_PV}.zip"

LICENSE="as-is"

KEYWORDS="-* amd64 x86"

# Needs latest doom3 from http://bugs.gentoo.org/show_bug.cgi?id=167173
# iD messed up their own numbering, so can't use ">="
RDEPEND="=${CATEGORY}/${GAME}-1.3.1.1304"

src_unpack() {
	mkdir "${MOD_DIR}"
	cd "${MOD_DIR}" || die

	unpack ${A}

	# Better name than "emz" in Doom3's mod list
	[[ -e description.txt ]] || echo "${MOD_NAME}" > description.txt
}
