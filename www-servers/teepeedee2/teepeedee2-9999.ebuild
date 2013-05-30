# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2 git-2
#MY_USER="vii"
MY_USER="longlene"
MY_PN="teepeedee2"

DESCRIPTION="A fast webapplication framework for dynamic webpages in Common Lisp."
HOMEPAGE="http://github.com/vii/teepeedee2"
SRC_URI=""

EGIT_REPO_URI="git://github.com/${MY_USER}/${MY_PN}.git"

LICENSE="LLGPL"
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
>dev-lisp/trivial-backtrace-1.0.2
dev-lisp/parenscript"

src_prepare() {
	rm quickstart.lisp # no need 
}

src_install() {
	common-lisp-install ${MY_PN}.asd src t
	common-lisp-symlink-asdf
	dodoc "LICENCE" README.markdown
	dohtml doc/{index.html,style.css}
}
