# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp implementation of Bse64 Encoding/Decoding."
HOMEPAGE="http://homepage.mac.com/svc/s-base64/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/svenvc/s-base64.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

src_install() {
	common-lisp-install src test ${PN}.asd
	common-lisp-symlink-asdf
	dohtml doc/*.html
	dodoc README.txt
}
