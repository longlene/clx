# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

DESCRIPTION="A library meant to make writing portable multi-threaded apps simple."
HOMEPAGE="http://common-lisp.net/project/bordeaux-threads/"
SRC_URI="http://common-lisp.net/project/${PN}/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/alexandria
		dev-lisp/fiveam"

CLSYSTEMS="bordeaux-threads bordeaux-threads-test"

src_install() {
	common-lisp-install *.asd src version.lisp-expr test
	common-lisp-symlink-asdf
	cat > README <<EOF
You can find API documentation on the project's wiki:
http://trac.common-lisp.net/bordeaux-threads/wiki/ApiDocumentation
EOF
	dodoc CONTRIBUTORS README
}
