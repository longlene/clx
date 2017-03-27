# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="C Markdown parser"
HOMEPAGE="https://github.com/mity/md4c"
SRC_URI="https://github.com/mity/md4c/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/md2html/md2html
	dolib.a ${BUILD_DIR}/md4c/libmd4c.a
	insinto /usr/include
	doins md4c/md4c.h
	dodoc README.md
}
