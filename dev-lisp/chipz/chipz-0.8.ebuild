# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit common-lisp-3

#MY_P=${PN}_${PV}

DESCRIPTION="A library for decompressing deflate, zlib, and gzip data."
HOMEPAGE="http://method-combination.net/lisp/chipz/"
SRC_URI="https://github.com/froydnj/chipz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

#S="${WORKDIR}"/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/gentoo-fix-asd.patch
}

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dodoc TODO NEWS
	dohtml doc/{index.html,style.css,chipz-doc.txt}
}
