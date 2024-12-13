# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=8

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
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""
DEPEND="=dev-lisp/acl-compat-${PV}*"

CLPACKAGE=htmlgen

#S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}.orig
S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}-dfsg

src_install() {
	cd aserve/htmlgen
	common-lisp-3_src_install
}
