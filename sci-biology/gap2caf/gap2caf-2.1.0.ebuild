# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils autotools

DESCRIPTION="GAP4 file format to CAF v2 format converter for genomic assembly data"
HOMEPAGE="http://www.sanger.ac.uk/resources/software/caf/"
SRC_URI="ftp://ftp.sanger.ac.uk/pub/PRODUCTION_SOFTWARE/src/gap2caf-2.1.0.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DEPEND="sci-biology/staden
		dev-lang/tcl"
RDEPEND="${DEPEND}"

#src_prepare(){
#	epatch "${FILESDIR}"/Makefile.in-"${PV}".patch || die
#}

src_configure(){
	sed -i 's:/include/tcl8.4:/include:' configure.ac || die
	sed -i 's:libtcl8.4:libtcl8.5:' configure.ac || die
	sed -i 's:tcl8.4:tcl8.5:' src/Makefile.am || die
	automake
	autoconf
	sed -i 's:/include/tcl8.4:/include:' configure
	sed -i 's:libtcl8.4:libtcl8.5:' configure
	# STADENROOT=/usr/share/staden is used to find staden.profile and staden_config.h
	# STADENSRC is used to locate gap4/IO.h
	#CPPFLAGS="$CPPFLAGS -I/home/mmokrejs/proj/staden/staden/trunk/src" \
	#LDFLAGS="$LDFLAGS -L/usr/lib/staden -lmutlib -lprimer3 -lg -lmisc" \
	econf --with-stadenroot=/usr \
	--with-tcl=/usr \
	--with-stadensrc=/home/mmokrejs/proj/staden/staden/tags/rel-2-0-0-b7/src || die
	#sed -i 's:prefix = /usr:prefix = $(DESTDIR)/usr:' Makefile || die
	#sed -i 's:prefix = /usr:prefix = $(DESTDIR)/usr:' src/Makefile || die
	sed -i 's:tcl8.4:tcl8.5:' src/Makefile || die
}

# TODO: the 2.0.2 archive lacks manpages compared to 2.0, FIXME
# The man/Makefile.in is screwed in 2.0.2 so we cannot use it to install the manpage files,
# not even copying over whole caftools-2.0/man/ to caftools-2.0.2/man does not help.
src_install(){
	emake install DESTDIR="${D}" || die
}

