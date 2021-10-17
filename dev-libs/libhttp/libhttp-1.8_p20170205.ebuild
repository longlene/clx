# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="702ef541dd0691882dc349feaea301b25eaa1b59"

DESCRIPTION="Cross platform HTTP and HTTPS library"
HOMEPAGE="https://www.libhttp.org/"
SRC_URI="https://github.com/lammertb/libhttp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/Werror/d' Makefile
}

src_install() {
	dolib.a lib/libhttp.a
	insinto /usr/include
	doins include/libhttp.h
	dodoc README.md
}
