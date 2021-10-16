# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake git-r3

DESCRIPTION="Web is a C++ web framework"
HOMEPAGE="https://github.com/mpapierski/web"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mpapierski/web.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/ADD_SUBDIRECTORY/{/examples/d}' \
		-e '/ADD_SUBDIRECTORY/{/tests/d}' \
		-i CMakeLists.txt
}

src_install() {
	dolib.a "${BUILD_DIR}"/src/libweb.a
	insinto /usr
	doins -r include
	dodoc README.md
}
