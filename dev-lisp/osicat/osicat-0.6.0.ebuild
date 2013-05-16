# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

MY_P="${PN}_${PV}"

DESCRIPTION="${PN} is a lightweight operating system interface for Common Lisp on Unix-platforms."
HOMEPAGE="http://www.common-lisp.net/project/osicat/"
SRC_URI="http://common-lisp.net/project/${PN}/files/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/uffi"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	#epatch "${FILESDIR}"/${PV}-gentoo.patch
}

src_install() {
	common-lisp-install osicat.asd posix src
	common-lisp-symlink-asdf
	dodoc README
}
