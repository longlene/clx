# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 git-2

DESCRIPTION="S-XML-RPC is an implementation of XML-RPC in Common Lisp for both client and server."
HOMEPAGE="http://www.common-lisp.net/project/s-xml-rpc/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Publitechs/s-xml-rpc.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/s-xml
		dev-lisp/s-base64
		dev-lisp/s-sysdeps"


src_install() {
	rm Makefile
	common-lisp-install src test ${PN}.asd
	common-lisp-symlink-asdf
	dohtml doc/{S-XML-RPC.html,index.html,style.css}
	dodoc ChangeLog
}
