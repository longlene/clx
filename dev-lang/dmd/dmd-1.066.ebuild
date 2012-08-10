# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils multilib flag-o-matic

MY_P=${P/-/.}

DESCRIPTION="Digital Mars D Compiler"
HOMEPAGE="http://www.digitalmars.com/d/"
SRC_URI="http://ftp.digitalmars.com/${MY_P}.zip"

# License doesn't allow redistribution
LICENSE="DMD"
RESTRICT="mirror"
SLOT="1"
KEYWORDS="~amd64"
IUSE="tools"

DEPEND="sys-apps/findutils
	app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/dmd"

src_prepare() {
	# remove unnecessary files
	rm -r freebsd html osx linux/lib/* \
	linux/bin/{README.TXT,dmd,dmd.conf} windows \
	samples README.TXT license.txt || die "something went wrong"

	cd "${S}"/src

	# patch for slot-compatibility
	epatch "${FILESDIR}/slot-compat.patch"
	# patch for makefile
	epatch "${FILESDIR}/${P}-makefile.patch"
	# fix stack elf
	epatch "${FILESDIR}/stackelf.patch"

	append-ldflags $(no-as-needed)
}

src_compile() {
	cd "${S}"/src/dmd

	# make dmd
	emake -f linux.mak
	cp dmd idgen impcnvgen optabgen "${S}"/linux/bin || die "failed"
	fperms guo=rx ../../linux/bin/dmd

	# make phobos
	cd "${S}"/src/phobos
	# zlib 1.2.5 will be statically linked
	emake -j1 -f linux.mak "DMD="${S}"/linux/bin/dmd"
	cp libphobos.a "${S}"/linux/lib || die "failed"

	# Clean up
	emake -f linux.mak clean
	find "${S}" \( -name "*.c" -o -name "*.h" -o -name "*.mak" -o -name "*.txt" \
	-o -name "*.obj" -o -name "*.ddoc" -o -name "*.asm" \) -exec rm -v {} \; || die "failed"
}

src_install() {
	# Lib
	dolib.a linux/lib/libphobos.a

	# Install dmd compiler
	newbin linux/bin/dmd dmd1

	# Build new dmd1.conf
	cat > dmd1.conf << END
[Environment]
DFLAGS=-I/usr/include/phobos1 -L-L/usr/$(get_libdir)
END
	insinto /etc
	doins dmd1.conf

	# Includes
	insinto /usr/include/phobos1
	doins -r src/phobos/*

	# Man pages
	newman man/man1/dmd.1 dmd1.1
	newman man/man1/dmd.conf.5 dmd1.conf.5

	if use tools; then
		doman man/man1/dumpobj.1
		doman man/man1/obj2asm.1
		doman man/man1/rdmd.1

		# Tools
		dobin linux/bin/{dumpobj,obj2asm,rdmd}
	fi
}

pkg_postinst () {
	ewarn "                                                 "
	ewarn "DMD1 uses "dmd1.conf", not "dmd.conf"!           "
	ewarn "                                                 "
}
