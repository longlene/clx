# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="utf8 string functions for C/C++"
HOMEPAGE="https://github.com/sheredom/utf8.h"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sheredom/utf8.h.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins utf8.h
	dodoc README.md
}
