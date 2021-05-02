# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="A minimalistic initrd implementation"
HOMEPAGE="https://github.com/chris-se/tiny-initrd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/chris-se/tiny-initrd.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake CC=cc
}

src_install() {
	dobin tiny_initrd
	dodoc README.md
}
