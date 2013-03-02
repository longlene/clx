# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-htmlgen/cl-htmlgen-1.2.42.20060121.ebuild,v 1.2 2007/02/03 17:35:19 flameeyes Exp $

inherit common-lisp-3

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="Franz's library for generating HTML from Common Lisp programs"
HOMEPAGE="http://portableaserve.sourceforge.net/
	http://packages.debian.org/unstable/web/cl-htmlgen.html"
#SRC_URI="mirror://gentoo/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.orig.tar.gz"
SRC_URI="https://mydebian.googlecode.com/files/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.orig.tar.gz"
LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""
DEPEND="=dev-lisp/acl-compat-${PV}*"

CLPACKAGE=webactions

#S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}.orig
S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}-dfsg

src_install() {
	cd aserve/webactions
	common-lisp-3_src_install
}
