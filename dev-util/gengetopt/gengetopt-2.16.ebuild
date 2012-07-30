# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Gengetopt is a tool to write option parsing code for C programs."
HOMEPAGE="http://www.gnu.org/software/gengetopt/gengetopt.html"
SRC_URI="ftp://ftp.gnu.org/gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="examples doc"

DEPEND="sys-devel/flex"

src_compile() {
    econf || die "econf failed"

    cd ${S}/src
    emake || die "emake failed"

    cd ${S}/doc
    emake || die "emake failed"
}

src_test() {
    cd ${S}/tests
    make check || die "make check failed"
}

src_install() {
    dobin ${S}/src/gengetopt

    insinto /usr/share/${PN}
    doins src/gnugetopt.h src/getopt.c src/getopt1.c

    doman doc/*.1  

    if use doc ; then
        dodoc COPYING ChangeLog NEWS README THANKS TODO
        dohtml doc/*.html
        doinfo doc/*.info
    fi

    if use examples ; then
        insinto /usr/share/doc/${P}/examples
        doins doc/sample1.ggo doc/sample2.ggo doc/main1.cc doc/main2.c
        doins doc/cmdline1.c doc/cmdline1.h doc/cmdline2.c doc/cmdline2.h
    fi
}

