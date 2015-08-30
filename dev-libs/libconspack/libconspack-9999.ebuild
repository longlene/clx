# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Conspack implementation for C"
HOMEPAGE="https://github.com/conspack/libconspack"
SRC_URI=""

EGIT_REPO_URI="https://github.com/conspack/libconspack.git"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	./autogen
	econf --prefix=/usr || die "configure failed"
}
