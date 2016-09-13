# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-3
MY_USER="vii"

DESCRIPTION="More powerful and prettier way of text matching in Common Lisp."
HOMEPAGE="http://github.com/vii/cl-irregsexp"
SRC_URI="http://common-lisp.net/project/cl-irregsexp/downloads/cl-irregsexp.tar.gz -> ${P}.tgz"

LICENSE="Unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/alexandria"
src_unpack() {
	unpack ${A}
	mv *${PN}* "${S}"
}

src_install() {
	common-lisp-install ${PN}.asd src t
	common-lisp-symlink-asdf
	dohtml doc/{index.html,style.css}

}
