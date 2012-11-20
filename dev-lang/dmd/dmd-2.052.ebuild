# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils multilib

DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://www.digitalmars.com/d/"
SRC_URI="http://ftp.digitalmars.com/${PN}.${PV}.zip"

LICENSE="DMD"
SLOT="2"
KEYWORDS="~x86 ~amd64"
IUSE="multilib doc examples"

RESTRICT="mirror"

DEPEND="sys-apps/findutils
	!dev-lang/dmd-bin:2
	app-arch/unzip"

S="${WORKDIR}/${PN}2/src"

src_unpack() {
	unpack $A
	cd dmd2

	rm -rf osx linux windows README.TXT
	use doc || rm -rf html
	use examples || rm -rf samples

	edos2unix `find . -name '*.c' -type f`
	edos2unix `find . -name '*.d' -type f`
	edos2unix `find . -name '*.ddoc' -type f`
	edos2unix `find . -name '*.h' -type f`
	edos2unix `find . -name '*.mak' -type f`
	edos2unix `find . -name '*.txt' -type f`
	use examples && edos2unix `find samples -name '*.html' -type f`
	edos2unix src/dmd/linux.mak src/phobos/linux.mak src/phobos/etc/c/zlib/linux.mak

	epatch "${FILESDIR}/${P}.patch"

	cd src/dmd

}

src_compile() {
# DMD
	cd "${S}/dmd"
	ln -s . mars
	if use x86; then
		emake -f linux.mak MODEL=32 || die "make failed for dmd (32bit)"
	elif use amd64; then
		emake -f linux.mak MODEL=64 || die "make failed for dmd (64bit)"
	fi

# druntime
	cd "${S}/druntime/"

	if use x86 || use amd64 && use multilib; then
		emake -f posix.mak MODEL=32 "DMD=${S}/dmd/dmd" || die "Failed to build phobos2 32bit"
	fi
	if use amd64; then
		emake -f posix.mak MODEL=64 "DMD=${S}/dmd/dmd" || die "Failed to build phobos2 64bit"
	fi

# Phobos
	cd "${S}/phobos"
	if use x86 || use amd64 && use multilib; then
		emake -f posix.mak MODEL=32 "DMD=${S}/dmd/dmd" || die "Failed to build phobos2 32bit"
	fi
	if use amd64; then
		emake -f posix.mak MODEL=64 "DMD=${S}/dmd/dmd" || die "Failed to build phobos2 64bit"
	fi

}

src_test() {
	cd "${S}/../samples/d" || die "No samples?"
	# XXX: to avoid using libraries from /usr/lib{,32,64} we will specify library files directly
	#DFLAGS="-I${S}/phobos -I${S}/druntime/import -L-L${S}/phobos/generated/linux/release32 -L-L${S}/phobos/generated/linux/release64 -L-lrt"
	DFLAGS="-I${S}/phobos -I${S}/druntime/import -L-lrt"
	DMD="${S}/dmd/dmd"
	if use x86 || use amd64 && use multilib; then
		${DMD} -m32 ${DFLAGS} -L${S}/phobos/generated/linux/release32/libphobos2.a hello.d || die "Failed to build hello.d (32bit)"
		./hello 32bit || die "Failed to run test sample (32bit)"
		rm hello.o hello
	fi
	if use amd64; then
		${DMD} -m64 ${DFLAGS} -L${S}/phobos/generated/linux/release64/libphobos2.a hello.d || die "Failed to build hello.d (64bit)"
		./hello 64bit || die "Failed to run test sample (64bit)"
		rm hello.o hello
	fi
}

src_install() {
# prepeare and install config
	cd "${S}/dmd"
	cat > dmd.conf << EOF
[Environment]
DFLAGS=-I/usr/include/phobos2 -I/usr/include/druntime -L-L--no-warn-search-mismatch -L--export-dynamic -L-lrt
EOF
	insinto /etc
	doins dmd.conf

	cd "${S}/.."

# Compiler
	#newbin "${S}/dmd/dmd" dmd2.bin || die "Install failed"
	dobin "${S}/dmd/dmd" || die "Install failed"

# Man pages, docs and samples
	doman man/man1/dmd.1 || die
	doman man/man1/dmd.conf.5 || die

	use doc && dohtml -r html/*

	if use examples; then
		dodir /usr/share/doc/${PF}/samples || die
		cp -R samples/d/* "${D}"/usr/share/doc/${PF}/samples/ || die
	fi

# druntime & Phobos
	if use amd64; then
		dolib.a "${S}/druntime/lib64/libdruntime.a" || die "Install failed"
		dolib.a "${S}/phobos/generated/linux/release64/libphobos2.a" || die "Install failed"
	fi
	if use x86 || use amd64 && use multilib; then
		use amd64 && multilib_toolchain_setup x86
		dolib.a "${S}/druntime/lib32/libdruntime.a" || die "Install failed"
		dolib.a "${S}/phobos/generated/linux/release32/libphobos2.a" || die "Install failed"
		# TODO: restore target architecture
	fi

# cleanup builds
	rm -rf "${S}/druntime/obj"* "${S}/druntime/lib"*
	rm -rf "${S}/phobos/generated"

# includes
	dodir /usr/include/druntime
	mv "${S}/druntime/import"/* "${D}/usr/include/druntime/"

	dodir /usr/include/phobos2
	mv "${S}/phobos"/* "${D}/usr/include/phobos2/"

}

pkg_postinst () {
	if use doc || use examples; then
		einfo "                                                 "
		einfo "The bundled docs and/or samples may be found in  "
		einfo "/usr/share/doc/${PF}                             "
		einfo "                                                 "
	fi
}
