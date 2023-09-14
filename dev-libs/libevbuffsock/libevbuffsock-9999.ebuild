# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="buffered socket library for libev"
HOMEPAGE="https://github.com/mreiferson/libevbuffsock"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mreiferson/libevbuffsock.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a ${PN}.a
	insinto /usr/include
	doins evbuffsock.h
	dodoc README.md
}
