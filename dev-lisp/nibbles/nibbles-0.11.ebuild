# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3 eutils

MY_P=${PN}_${PV}

DESCRIPTION="A library for accessing multibyte integers from octet arrays and streams"
HOMEPAGE="http://method-combination.net/lisp/nibbles/"
SRC_URI="https://github.com/froydnj/nibbles/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoo-fix-asd.patch
}

src_install() {
	common-lisp-install-sources .
	common-lisp-install-asdf
	dodoc README doc/nibbles-doc.txt
	dohtml doc/{index.html,style.css}
}
