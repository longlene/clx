# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3

MY_PV=${PV:0:4}-${PV:4:2}-${PV:6:2}

DESCRIPTION="An HTML parser written in Common Lisp."
HOMEPAGE="http://common-lisp.net/project/closure/closure-html/"
SRC_URI="http://common-lisp.net/project/closure/download/${PN}-${MY_PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/closure-common
		dev-lisp/flexi-streams"

S="${WORKDIR}"/${PN}-${MY_PV}

src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all resources
	common-lisp-install-asdf
	dodoc README
	dohtml doc/*.{html,css}
}
