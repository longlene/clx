# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit common-lisp-3

DESCRIPTION="Common Lisp dokuwiki parser."
HOMEPAGE="http://github.com/archimag/wiki-parser"
SRC_URI="https://github.com/archimag/wiki-parser/archive/version-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/alexandria
dev-lisp/iterate
dev-lisp/cl-ppcre"

S="${WORKDIR}/${PN}-version-${PV}"

src_install() {
	common-lisp-install-sources src t
	common-lisp-install-asdf ${PN}.asd
}
