# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3

DESCRIPTION="A library meant to make writing portable multi-threaded apps simple."
HOMEPAGE="http://common-lisp.net/project/bordeaux-threads/"
SRC_URI="https://github.com/sionescu/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/alexandria"

CLSYSTEMS="bordeaux-threads"

src_install() {
	common-lisp-install *.asd src version.sexp test
	common-lisp-symlink-asdf
	cat > README <<EOF
You can find API documentation on the project's wiki:
http://trac.common-lisp.net/bordeaux-threads/wiki/ApiDocumentation
EOF
	dodoc CONTRIBUTORS README
}
