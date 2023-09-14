# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs multilib

DESCRIPTION="It's a complete cross development package for 65(C)02 systems."
HOMEPAGE="http://www.cc65.org"
#SRC_URI="ftp://ftp.musoftware.de/pub/uz/cc65/snapshot/cc65-snapshot-sources-${PV}.tar.bz2"
SRC_URI="ftp://ftp.musoftware.de/pub/uz/${PN}/${PN}-sources-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( app-text/linuxdoc-tools )"
RDEPEND=""

#S="${WORKDIR}"/${PN}-snapshot-${PV}

src_prepare() {
	# uncomment to install sim65
	#sed -i -e "s:od65:od65 sim65:g" src/make/gcc.mak

	# correct paths for install (also in documentation)
	sed -i -e "s:)/lib:)/$(get_libdir):g" make/gcc.mak
	sed -e "s:/usr/lib/cc65:/usr/$(get_libdir)/cc65:g" \
	    -i src/ca65/make/gcc.mak -i doc/ca65.sgml \
	    -i src/cc65/make/gcc.mak -i doc/cc65.sgml \
	    -i src/ld65/make/gcc.mak -i doc/ld65.sgml

	# solve conflict by renameing make.info to cc65make.info
	sed -i -e "s:make.html:cc65make.html:g" doc/index.sgml
	sed -i -e "s:make.sgml:cc65make.sgml:g" doc/Makefile
	mv doc/make.sgml doc/cc65make.sgml

	epatch "${FILESDIR}"/cc65-2.13.2-asneeded-1.patch
}

src_compile() {
	# the build needs to be split otherwise we can't specify CC
	# these makefiles are not parallel build aware
	emake -j1 -C src -f make/gcc.mak CC="$(tc-getCC)" AR="$(tc-getAR)" CFLAGS="-g -O2 -Wall -W -std=c89 ${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "src build fail"
	emake -j1 -C libsrc || die "libsrc build fail"
	use doc && emake -j1 -C doc html info
}

src_install() {
	# can't trust the install target (sandbox violation) so do it by hand
	dobin src/*65/*65 src/ca65html/ca65html src/grc/grc  || die "dobin fail"
	insinto /usr/$(get_libdir)/cc65/emd
	doins libsrc/*.emd || die "install memory map fail"
	insinto /usr/$(get_libdir)/cc65/joy
	doins libsrc/*.joy || die "install joystick driver fail"
	insinto /usr/$(get_libdir)/cc65/mou
	doins libsrc/*.mou || die "install mouse driver fail"
	insinto /usr/$(get_libdir)/cc65/ser
	doins libsrc/*.ser || die "install UART driver fail"
	insinto /usr/$(get_libdir)/cc65/tgi
	doins libsrc/*.tgi || die "install graphic driver fail"
	insinto /usr/$(get_libdir)/cc65/asminc
	doins asminc/*.inc || die "install asm include fail"
	insinto /usr/$(get_libdir)/cc65/include
	doins -r include/* || die "install include fail"
	insinto /usr/$(get_libdir)/cc65/lib
	doins libsrc/*.lib || die "install lib definations fail"
	doins libsrc/*.o || die "install lib fail"
	insinto /usr/$(get_libdir)/cc65/cfg
	doins src/ld65/cfg/*.cfg || die "cfg install fail"
	use doc && dohtml doc/*.htm*
	use doc && insinto /usr/share/doc/${PF}/html
	use doc && doins doc/*.txt
	doman packages/debian/*.1 || die "man install fail"
	use doc && doinfo doc/*.info
	dodoc src/ca65/macpack/*.mac doc/readme.1st doc/BUGS doc/CREDITS || die "macro install fail"
}
