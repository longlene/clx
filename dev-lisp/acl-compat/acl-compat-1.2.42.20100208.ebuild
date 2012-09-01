# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="Compatibility layer for Allegro Common Lisp"
HOMEPAGE="http://portableaserve.sourceforge.net/
	http://packages.debian.org/unstable/web/cl-acl-compat"
SRC_URI="mirror://debian/pool/main/c/cl-portable-aserve/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}-dfsg.orig.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/puri
		dev-lisp/cl-ppcre"

S="${WORKDIR}"/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}-dfsg.orig

src_install() {
	cd ${PN}
	common-lisp-install *.{lisp,asd,system}
	common-lisp-install allegro clisp cmucl lispworks mcl sbcl scl
	common-lisp-symlink-asdf
	dodoc ChangeLog CREDITS README
}
