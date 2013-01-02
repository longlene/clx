# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2 git-2
#MY_USER="vii"

DESCRIPTION="More powerful and prettier way of text matching in Common Lisp."
HOMEPAGE="http://common-lisp.net/projects/cl-irregsexp/"
SRC_URI=""

EGIT_REPO_URI="http://common-lisp.net/projects/cl-irregsexp/cl-irregsexp.git"

LICENSE="Unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/alexandria"
#src_unpack() {
#	unpack ${A}
#	mv *${PN}* "${S}"
#}
#
src_install() {
	common-lisp-install ${PN}.asd src t
	common-lisp-symlink-asdf
	dohtml doc/{index.html,style.css}

}
