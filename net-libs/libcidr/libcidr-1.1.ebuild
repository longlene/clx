# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A library for manipulating CIDR notations; IPv6 enabled ipcalc (cidrcalc)"
HOMEPAGE="http://www.over-yonder.net/~fullermd/projects/libcidr/"
SRC_URI="http://www.over-yonder.net/~fullermd/projects/libcidr/${P}.tar.bz2"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND="${DEPEND}"

RDEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	# Use CFLAGS as defined in the system
	sed -i 's/^_CFLAGS \:= \(-g -Os -pipe\) \(.*\)/_CFLAGS ?= \1\n_CFLAGS += \2/;' src/*.inc
}

src_compile() {
	export _CFLAGS="${CFLAGS}"
	emake || die "emake failed"
}

src_install() {
	cd ${S}

	dobin src/examples/cidrcalc/cidrcalc

	dolib src/libcidr.so.0 src/libcidr.so

	insinto /usr/include
	doins include/libcidr.h

	doman docs/libcidr.3

	dodoc README LICENSE

	if use doc ; then
		insinto /usr/share/doc/${P}
		rm -f src/examples/*.o src/examples/*/*.o
		dosed -r src/examples
		doins -r src/examples
	fi
}
