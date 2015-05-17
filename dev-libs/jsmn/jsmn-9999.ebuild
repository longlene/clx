# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit mercurial

DESCRIPTION="A minimalistic JSON parser in C"
HOMEPAGE="http://zserge.com/jsmn.html"
SRC_URI=""

EHG_REPO_URI="https://bitbucket.org/zserge/jsmn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins jsmn.h
	dolib.a libjsmn.a
	dodoc README.md
}
