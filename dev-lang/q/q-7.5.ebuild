# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Q is a functional language based on term rewriting."
HOMEPAGE="http://q-lang.sourceforge.net"
SRC_URI="http://prdownloads.sourceforge.net/q-lang/${P}.tar.gz"
#SRC_URI="http://prdownloads.sourceforge.net/q-lang/${P}.tar.gz?download"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="X ggi iodbc odbc gmp tk readline imagemagick freetype gdbm curl threads nls dmalloc xml iconv unicode"
RDEPEND="virtual/libc
	ggi? ( media-libs/ggi )
	odbc? ( dev-db/unixODBC )
	iodbc? ( dev-db/libiodbc )
	tk? ( dev-lang/tk )
	readline? ( sys-libs/readline )
	imagemagick? ( media-gfx/imagemagick )
	freetype? ( media-libs/freetype )
	gdbm? ( sys-libs/gdbm )
	curl? ( net-misc/curl )
	dmalloc? ( dev-libs/dmalloc )
	iconv? ( virtual/libiconv )
	xml? ( dev-libs/libxml2 
	       dev-libs/libxslt )
	nls? ( sys-devel/gettext )"
DEPEND="${RDEPEND}"
#S="${WORKDIR}/${P}"

src_compile() {
    local myconf=""
    use X || myconf="--without-x $myconf"
    use freetype || myconf="--without-ft2 $myconf"
    use ggi || myconf="--without-ggi $myconf"
    # configure uses on of the ODBC libraries; not possible
    # to specify which one yet.
    use odbc || use iodbc || myconf="--without-odbc $myconf"
    use tk || myconf="--without-tk $myconf"
    use readline || myconf="--without-readline $myconf"
    use imagemagick || myconf="--without-imagemagick $myconf"
    use gdbm || myconf="--without-gdbm $myconf"
    use curl || myconf="--without-curl $myconf"
    use nls || myconf="--disable-nls $myconf"
    use dmalloc || myconf="--without-dmalloc $myconf"
    use unicode || myconf="--without-unicode $myconf"
    use iconv || myconf="--without-libiconv $myconf"
    use xml || myconf="--without-xml $myconf"
    use threads || myconf="--without-pthread $myconf"
    econf $myconf || die "econf failed"
    emake || die "emake failed"
}

src_install() {
    einstall || die "einstall failed"
}
