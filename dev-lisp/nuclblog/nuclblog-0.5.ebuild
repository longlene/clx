# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

MY_P=${PN}_${PV}

DESCRIPTION="Virtual hosting with Hunchentoot."
HOMEPAGE="http://www.cyrusharmon.org/projects?project=hunchentoot-vhost"
SRC_URI="http://cyrusharmon.org/static/releases/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-lisp/hunchentoot-1.0.0
		dev-lisp/cl-who
		dev-lisp/cl-store
		dev-lisp/md5
		dev-lisp/bordeaux-threads
		>=dev-lisp/hunchentoot-vhost-0.2
		>=dev-lisp/hunchentoot-auth-0.2"

S="${WORKDIR}"/${MY_P}

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/fix-asd.patch
	rm "${S}"/nuclblog-demo.asd
}

src_install() {
	common-lisp-install *.{lisp,asd} version.lisp-expr css/
	common-lisp-symlink-asdf
	dodoc NEWS README ChangeLog
}
