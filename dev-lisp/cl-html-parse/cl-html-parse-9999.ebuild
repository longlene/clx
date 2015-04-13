# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 git-2

DESCRIPTION="A parser that parses HTML documents and generates a sexp-based representation."
HOMEPAGE="http://www.cl-user.net/asp/libs/cl-html-parse
		http://www.cliki.net/CL-HTML-Parse"
SRC_URI=""
EGIT_URI="https://github.com/gwkkwg/cl-html-parse.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

#S="${WORKDIR}"/${PN}

#src_unpack() {
#	unpack ${A}
#	sed -i s,http-parse,html-parse,g "${S}"/cl-html-parse.asd
#	sed -i s,HTTP-PARSE,HTML-PARSE,g "${S}"/dev/README
#}

#src_install() {
#	common-lisp-install ${PN}.asd dev/*.lisp
#	common-lisp-symlink-asdf
#	dohtml -r dev/examples
#	dodoc dev/README
#}
