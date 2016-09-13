# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-3
MY_USER="skypher"

DESCRIPTION="An implementation of the OAuth 1.0a standard in Common Lisp."
HOMEPAGE="http://github.com/skypher/cl-oauth"
SRC_URI="https://github.com/${MY_USER}/${PN}/tarball/master -> ${P}.tgz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND=""
src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

src_install() {
	common-lisp-install ${PN}.asd src test
	common-lisp-symlink-asdf
	dodoc LICENSE README
}
