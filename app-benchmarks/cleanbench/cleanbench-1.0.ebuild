# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-benchmarks/cleanbench/cleanbench-1.0.ebuild,v 1.0 2008/12/11 11:58:01 mattst88 Exp $

inherit eutils toolchain-funcs

DESCRIPTION="clean nbench Benchmark utility for Linux/UNIX"
HOMEPAGE="http://mattst88.com/programming/cleanbench/"
SRC_URI="http://mattst88.com/programming/cleanbench/${P}.tar.bz2"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""

DEPEND="virtual/libc
	dev-libs/libproccpuinfo"

src_compile() {
	sed -i -e 's:inpath="NNET.DAT":inpath="/usr/share/cleanbench/NNET.DAT":' neural.c || die

	emake CC=$(tc-getCC) CFLAGS="${CFLAGS}" || die "make failed"
}

src_install() {
	dobin cleanbench
	insinto /usr/share/cleanbench
	doins NNET.DAT
	dodoc README bdoc.txt
}
