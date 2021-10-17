# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake git-r3

DESCRIPTION="Easy SHM library for C++"
HOMEPAGE="https://github.com/RaftLib/shm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/RaftLib/shm.git"

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
