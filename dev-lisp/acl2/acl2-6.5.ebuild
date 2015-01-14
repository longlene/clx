# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib

MY_PV=${PV/./-}

DESCRIPTION="ACL2 is both a programming language in which you can model computer systems and a tool to help you prove properties of those models"
HOMEPAGE="http://www.cs.utexas.edu/users/moore/acl2/"
SRC_URI="http://www.cs.utexas.edu/users/moore/acl2/v${MY_PV}/distrib/acl2.tar.gz -> ${P}.tar.gz
http://www.acl2.org/Downloads/books-${PV}.tar.gz -> ${PN}-books-${PV}.tar.gz
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# use clisp's readline
DEPEND="dev-lisp/clisp"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-sources

src_prepare() {
	mv "${WORKDIR}"/books books
}

src_compile() {
	emake LISP=clisp || die "compile failed"
}

src_install() {
	cat >> acl2 <<EOF
#!/bin/sh

exec "clisp" -i "/usr/share/acl2-sources/.acl2rc" -p ACL2 -M "/usr/$(get_libdir)/${P}/saved_acl2.mem" -m 10MB -E ISO-8859-1 "\$@"
EOF

dobin acl2

	insinto /usr/$(get_libdir)/${P}
	doins saved_acl2.mem && rm saved_acl2.mem

	insinto /usr/share
	doins -r ${S}
}
