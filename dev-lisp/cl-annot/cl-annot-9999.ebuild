# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2 git-2
MY_USER="arielnetworks"

DESCRIPTION="Python-like Annotation Syntax for Common Lisp."
HOMEPAGE="http://github.com/arielnetworks/cl-annot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/arielnetworks/cl-annot.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/alexandria"
#src_unpack() {
#	unpack ${A}
#	mv *-${PN}-* "${S}"
#}

src_install() {
	common-lisp-install ${PN}.asd src misc t
	common-lisp-symlink-asdf
	dodoc README.markdown
}
