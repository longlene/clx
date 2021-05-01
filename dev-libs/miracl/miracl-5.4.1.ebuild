# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="crypto library"
HOMEPAGE="http://www.shamus.ie"
SRC_URI="http://chaox.net/~jens/${P}.zip"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"/

src_unpack() {
	unzip -qo -j -aa -L "${DISTDIR}/${A}" || die "failure unpacking ${A}"
}

src_prepare() {
	sed -i "s|gcc -c -m32 -O2|gcc -c -m32 $CFLAGS|g" linux
	sed -i "s|g++ -c -m32 -O2|g++ -c -m32 $CFLAGS|g" linux
	sed -i "s|gcc -c -m64 -O2|gcc -c -m64 -fPIC $CFLAGS|g" linux64
	sed -i "s|g++ -c -m64 -O2|g++ -c -m64 -fPIC $CFLAGS|g" linux64
	sed -i "s|mrmuldv.s|mrmuldv.S|g" linux
	sed -i "s|mrmuldv.s64|mrmuldv.S64|g" linux64
	epatch "${FILESDIR}"/$PN-noexecstack.patch || die 'patch failed'
}

src_compile() {
	if use amd64; then
		bash ./linux64 || die "compile failed"
	else
		bash ./linux || die "compile failed"
	fi
}

src_install() {
	dolib.a miracl.a || die "installing lib failed"
	insinto /usr/include/miracl
	doins miracl.h mirdef.h || die "installing headers failed"
	dodoc *.txt || die "installing docs failed"
}
