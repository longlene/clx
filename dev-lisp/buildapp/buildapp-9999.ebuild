# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-2 git-2

DESCRIPTION="Create executables with SBCL"
HOMEPAGE="http://www.xach.com/lisp/buildapp/"
SRC_URI=""

EGIT_REPO_URI="git@github.com:longlene/buildapp.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/sbcl"

RESTRICT="strip"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	common-lisp-install *.lisp ${PN}.asd
	common-lisp-symlink-asdf
	dobin buildapp
	dodoc README
	dodoc doc/LICENSE
	dohtml doc/{index.html,style.css}
}

