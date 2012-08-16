# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2

DESCRIPTION="A Common Lisp library for generation of UUIDs as described by RFC 4122."
HOMEPAGE="http://www.dardoria.net/software/uuid.html"
#SRC_URI="http://common-lisp.net/~sionescu/files/${P}.tar.bz2"
SRC_URI="https://github.com/dardoria/${PN}/tarball/20-07-2011 -> ${P}.tgz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/ironclad"

src_install() {
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	dohtml *.{html,png,jpeg}
}
