# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/lfe/lfe-0.7.ebuild,v 1.1 2014/03/13 07:51:29 patrick Exp $

EAPI=5

inherit multilib

DESCRIPTION="Lisp-flavoured Erlang"
HOMEPAGE="http://lfe.github.io/"
SRC_URI="https://github.com/rvirding/lfe/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

#eh?
#S=${WORKDIR}/${P}a

src_prepare() {
	sed -i -e 's/cp -pPR $(INCDIR) $(INSTALLDIR); \\/echo " "; \\/' Makefile || die
}

src_install() {
	insinto /usr/$(get_libdir)/lfe
	doins -r ebin
	exeinto /usr/$(get_libdir)/lfe/bin
	doexe bin/lfe bin/lfec bin/lfescript
	dodoc README.md
	dosym /usr/$(get_libdir)/lfe/bin/lfe /usr/bin/lfe
	dosym /usr/$(get_libdir)/lfe/bin/lfec /usr/bin/lfec
	dosym /usr/$(get_libdir)/lfe/bin/lfescript /usr/bin/lfescript
}
