# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="A tool for automating the process of benchmarking a web server"
HOMEPAGE="http://www.xenoclast.org/autobench/"
SRC_URI="http://www.xenoclast.org/autobench/downloads/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl
        app-benchmarks/httperf"

src_unpack() {
        unpack ${A}
        sed -i -e "s/-o crfile/${LDFLAGS} -o crfile/" \
-e "s/-o sesslog/${LDFLAGS} -o sesslog/" ${WORKDIR}/${P}/Makefile || die "dosed Failed"
}

src_compile(){
        emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" ${LDFLAGS} || die "Make Failed"
}

src_install() {
        dobin autobench autobench_admin autobenchd bench2graph crfile sesslog
        doman autobench.1 autobench_admin.1 autobenchd.1 bench2graph.1 crfile.1 sesslog.1
        dodoc ChangeLog README
        insinto /etc
        doins autobench.conf
}
