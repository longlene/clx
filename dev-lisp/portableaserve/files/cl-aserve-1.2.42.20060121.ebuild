# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-aserve/cl-aserve-1.2.42.20060121.ebuild,v 1.3 2007/02/03 17:32:34 flameeyes Exp $

inherit common-lisp eutils

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="A portable version of AllegroServe which is a web application server for Common Lisp programs."
HOMEPAGE="http://portableaserve.sourceforge.net/
	http://packages.debian.org/unstable/web/cl-aserve.html"
SRC_URI="mirror://gentoo/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.orig.tar.gz"
LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""
DEPEND="=dev-lisp/cl-acl-compat-${PV}*
	=dev-lisp/cl-htmlgen-${PV}*"

CLPACKAGE=aserve

S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}.orig

src_unpack() {
	unpack ${A}
	cd ${S}; epatch ${FILESDIR}/${PV}-clisp-gentoo.patch
}

src_install() {
	common-lisp-install aserve/*.cl aserve/*.asd
	common-lisp-system-symlink
	dodoc ChangeLog README README.cmucl INSTALL.lisp logical-hostnames.lisp
	insinto /usr/share/doc/${PF}/contrib
	doins contrib/*.lisp
	insinto /usr/share/doc/${PF}/examples
	doins aserve/examples/*
	insinto /usr/share/doc/${PF}/doc
	doins aserve/doc/*
}
