# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Portable URI library for Common Lisp based on the Franz, Inc. :net.uri module."
HOMEPAGE="http://files.kpe.io/puri/"
SRC_URI="http://files.kpe.io/${PN}/${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/ptester"

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dodoc README
}
