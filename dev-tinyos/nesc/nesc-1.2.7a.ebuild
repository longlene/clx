# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tinyos/nesc/nesc-1.2.7a.ebuild,v 1.4 2010/02/06 11:56:50 ulm Exp $

inherit eutils java-pkg-2

DESCRIPTION="An extension to gcc that knows how to compile nesC applications"
HOMEPAGE="http://nescc.sourceforge.net/"
SRC_URI="mirror://sourceforge/nescc/${P}.tar.gz"
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"
DEPEND=">=dev-lang/perl-5.8.5-r2
	>=dev-tinyos/tos-1.1.0
	>=virtual/jdk-1.4.2"

RDEPEND=">=dev-lang/perl-5.8.5-r2
	>=dev-tinyos/tos-1.1.0
	>=virtual/jre-1.4.2
	dev-perl/XML-Simple
	media-gfx/graphviz"

pkg_setup() {
	if [ -z "${TOSDIR}" ]
	then
		# best to make an assumption
		export TOSDIR=/usr/src/tinyos-1.x/tos
	fi

	if [ ! -d "${TOSDIR}" ]
	then
		eerror "In order to compile nesc you have to set the"
		eerror "\$TOSDIR environment properly."
		eerror ""
		eerror "You can achieve this by emerging >=dev-tinyos/tos-1.1.15"
		eerror "or by exporting TOSDIR=\"path to your tinyos dir\""
		die "Couldn't find a valid TinyOS home"
	else
		einfo "Building nesC for ${TOSDIR}"
	fi
	java-pkg-2_pkg_setup
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-alignment.patch
}

src_compile() {
	econf --disable-dependency-tracking || die "econf failed"
	# language setting needed, otherwise gcc version
	# will sometimes not be detected right
	LANGUAGE=C emake || die "emake failed"
}

src_install() {
	LANGUAGE=C einstall || die "einstall failed"
	if use doc
	then
		dohtml -r -a html,jpg,pdf,txt doc/*
	fi
	newdoc README NEWS
	dodoc doc/README
	newdoc tools/java/net/tinyos/nesc/dump/README README.dump
	newdoc tools/java/net/tinyos/nesc/wiring/README README.wiring
}

pkg_postinst() {
	elog "If you want better support for nesc language editing, see the"
	elog "readme.txt files for your editor in /usr/share/ncc/editor-modes"
	ebeep 5
	epause 5
}
