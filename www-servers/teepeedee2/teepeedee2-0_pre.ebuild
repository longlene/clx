# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2
MY_USER="vii"
MY_PN="teepeedee2"

DESCRIPTION="A fast webapplication framework for dynamic webpages in Common Lisp."
HOMEPAGE="http://github.com/vii/teepeedee2"
SRC_URI="https://github.com/${MY_USER}/${MY_PN}/tarball/master -> ${P}.tgz"

LICENSE="Lisp LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lisp/trivial-garbage
		dev-lisp/cl-cont
		dev-lisp/cffi
		dev-lisp/iterate
		dev-lisp/cl-fad
		dev-lisp/alexandria
		dev-lisp/cl-irregsexp
		dev-lisp/trivial-backtrace
		dev-lisp/parenscript"
src_unpack() {
	unpack ${A}
	mv *${PN}* "${S}"
}

src_install() {
	common-lisp-install ${MY_PN}.asd src t addons *.lisp
	common-lisp-symlink-asdf
	dodoc "LICENCE" README.markdown
	dohtml doc/{index.html,style.css}
}
