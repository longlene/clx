# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit npm

DESCRIPTION="Javascript Common Lisp Repl"
HOMEPAGE="https://jscl-project.github.io"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jscl
"

src_prepare() {
	eapply_user
	mv bin/repl.js bin/${PN}
}

