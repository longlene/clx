# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake git-r3

DESCRIPTION="Command Args"
HOMEPAGE="https://github.com/RaftLib/cmdargs"
SRC_URI=""

EGIT_REPO_URI="https://github.com/RaftLib/cmdargs.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/DESTINATION/{s/lib/$(get_libdir)/}" lib/CMakeLists.txt
}
