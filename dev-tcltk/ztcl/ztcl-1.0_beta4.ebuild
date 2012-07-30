# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/ztcl/ztcl-1.0_beta4.ebuild, v 1.00 2008/01/12 14:30:00 gtlinux Exp $

inherit eutils

DESCRIPTION="ZTCL is an extension library for TCL that implements an interface to the ZLIB compression and decompression library"
HOMEPAGE="http://gna.org/projects/ztcl"
SRC_URI="http://download.gna.org/ztcl/1.0/${PN}_1.0b4_src.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"

IUSE="doc"

RDEPEND="dev-lang/tcl
        dev-tcltk/tclmore
        sys-libs/zlib"
DEPEND="$RDEPEND
	sys-libs/glibc"

S="${WORKDIR}/${PN}_1.0b4"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/configure.patch
	epatch ${FILESDIR}/makefile.in.patch
	epatch ${FILESDIR}/pkgIndex.tcl.in.patch
        if ! use doc ; then
	       	rm -rf "${S}/doc"
        fi
}

src_install() {
      emake install INSTALL_ROOT="${D}" || die "Install failed"
      if use doc ; then
		dohtml ${D}/usr/doc/${PN}_1.0.4/HTML/* || die
		rm -rf ${D}/usr/doc/${PN}_1.0.4/HTML
      fi
      dodoc ${D}/usr/doc/${PN}_1.0.4/* ||  die
      rm -rf ${D}/usr/doc || die
}