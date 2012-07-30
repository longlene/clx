# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PV="${PV/_pre/.dev-r}"
MY_PF="${PN}-${MY_PV}"
DESCRIPTION="Manipulate trash cans via the command line"
HOMEPAGE="http://code.google.com/p/trash-cli/"
SRC_URI="http://trash-cli.googlecode.com/files/${MY_PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/unipath"

S="${WORKDIR}/${MY_PF}"

DOCS="README.txt"

src_install() {
	distutils_src_install
	doman man/man1/*
}
