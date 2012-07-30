# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="a z-machine interpreter using Glk for its input and output"
HOMEPAGE="http://www.ifarchive.org/indexes/if-archiveXinfocomXinterpretersXnitfol.html"
SRC_URI="http://www.ifarchive.org/if-archive/infocom/interpreters/nitfol/nitfol-0.5.tar.gz
	 http://www.ifarchive.org/if-archive/infocom/interpreters/nitfol/nitfol-0.5-patches.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RDEPEND=">=dev-libs/glkloader-0.3.2"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5.8.7-r3"

src_unpack() {
	unpack ${A}
	cd ${P}
	epatch ../*.patch
}

src_compile() {
	emake nitfol "DEFS=-DSMART_TOKENISER -DUSE_INLINE -D_GNU_SOURCE -DDEBUGGING" LDFLAGS=-rdynamic "CFLAGS=$CFLAGS" \
		GLKINCLUDEDIR=/usr/include/glk GLKLIBDIR=/usr/lib GLKMAKEFILE=Make.glkloader "GLKSPECIFIC=startunix.c graphics.c blorb.c sound.c" \
		PRODUCT=nitfol CFUNCTIONS=true || die "make failed"
}

src_install() {
	egamesinstall EXECUTABLES=nitfol
	dodoc README ChangeLog nitfol.html
}
