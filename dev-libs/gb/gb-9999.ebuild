# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="gb single-file public domain libraries for C & C++"
HOMEPAGE="https://github.com/gingerBill/gb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gingerBill/gb.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins gb{,_gl,_ini,_math,_regex,_string}.h
	dodoc README.md
}
