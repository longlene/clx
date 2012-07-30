# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Ficl is a programming language interpreter designed to be embedded into other systems as a command, macro, and development prototyping language."
SRC_URI="http://downloads.sourceforge.net/ficl/ficl4.0.31.tar.gz"
HOMEPAGE="http://ficl.sourceforge.net/"

S=${WORKDIR}/${P/_p/.r}

SLOT="0"
LICENSE="freedist"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

src_compile()
{
	epatch ${FILESDIR}/${P}-linux.patch
	emake -f Makefile.ansi || die
	emake -f Makefile.ansi lib || die
}

src_install() {

	dobin ficl

	dolib.a  libficl.a
	dolib.so libficl.so
	dolib    libficl.so.${PV}

	dodoc ReadMe.txt
	if use doc ; then
		 dohtml doc/*.html 
		 insinto /usr/share/doc/${PF}/html/graphics
		 doins doc/graphics/*
		 insinto /usr/share/doc/${PF}/articles
		 doins doc/articles/*
		 insinto /usr/share/doc/${PF}/source/
		 doins doc/source/*
    fi

	
	insinto /usr/include
	doins ficl.h
	doins ficltokens.h
}

