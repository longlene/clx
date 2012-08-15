# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

MY_P=${PN}_${PV}

DESCRIPTION="A Lisp parser and generator for the JSON data-interchange format."
HOMEPAGE="http://common-lisp.net/project/cl-json/
		http://www.cliki.net/cl-json"
SRC_URI="http://common-lisp.net/project/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/fiveam"

S="${WORKDIR}"/${MY_P}

src_install() {
	common-lisp-install src t ${PN}.asd
	common-lisp-symlink-asdf
	dodoc CONTRIBUTORS
	dohtml doc/{index.html,style.css}
}
