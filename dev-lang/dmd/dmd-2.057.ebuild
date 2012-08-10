# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils multilib bash-completion-r1

DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://www.digitalmars.com/d/"
SRC_URI="http://ftp.digitalmars.com/${PN}.${PV}.zip"

# DMD supports amd64/x86 exclusively
KEYWORDS="-* ~amd64 ~x86"
SLOT="2"
IUSE="multilib doc examples"

# License doesn't allow redistribution
LICENSE="DMD"
RESTRICT="mirror"

DEPEND="sys-apps/findutils
	app-arch/unzip"
RDEPEND="!dev-lang/dmd-bin"

S="${WORKDIR}/${PN}2/src"

rdos2unix() {
	edos2unix $(find . -name '*'.$1 -type f) || die "Failed to convert line-endings of all .$1 files"
}

src_prepare() {
	cd .. || die

	rm -r osx linux windows freebsd README.TXT || die "Failed to remove included binaries"

	# convert line-endings of file-types that start as cr-lf and are
	# patched or installed later on
	rdos2unix c
	rdos2unix d
	rdos2unix txt
	rdos2unix css

	# misc patches for the build process
	epatch "${FILESDIR}/${P}-makefile.patch"
}

src_compile() {
	# DMD
	ln -s . "dmd/mars" || die "Failed to add recursive symbolic link to DMD sources."
	if use x86; then
		einfo 'Building DMD for x86 ...'
		emake -C dmd -f posix.mak MODEL=32
	elif use amd64; then
		einfo 'Building DMD for amd64 ...'
		emake -C dmd -f posix.mak MODEL=64
	fi

	# druntime & Phobos
	if use x86 || (use amd64 && use multilib); then
		einfo 'Building druntime for x86 ...'
		emake -C druntime -f posix.mak MODEL=32 "DMD=../dmd/dmd"
		einfo 'Building Phobos for x86 ...'
		emake -C phobos -f posix.mak MODEL=32 "DMD=../dmd/dmd"
	fi
	if use amd64; then
		einfo 'Building druntime for amd64 ...'
		emake -C druntime -f posix.mak MODEL=64 "DMD=../dmd/dmd"
		einfo 'Building Phobos for amd64 ...'
		emake -C phobos -f posix.mak MODEL=64 "DMD=../dmd/dmd"
	fi
}

src_test() {
	local DFLAGS="-Iphobos -Idruntime/import -L-lrt"
	local DMD="dmd/dmd"
	if use x86 || (use amd64 && use multilib); then
		${DMD} -m32 ${DFLAGS} -Lphobos/generated/linux/release32/libphobos2.a ../samples/d/hello.d || die "Failed to build hello.d (32bit)"
		./hello 32bit || die "Failed to run test sample (32bit)"
	fi
	if use amd64; then
		${DMD} -m64 ${DFLAGS} -Lphobos/generated/linux/release64/libphobos2.a ../samples/d/hello.d || die "Failed to build hello.d (64bit)"
		./hello 64bit || die "Failed to run test sample (64bit)"
	fi
	rm hello.o hello
}

src_install() {
	# prepeare and install config
	cd "dmd" || die
	cat > dmd.conf << EOF
[Environment]
DFLAGS=-I/usr/include/phobos2 -I/usr/include/druntime -L-L--no-warn-search-mismatch -L--export-dynamic -L-lrt
EOF
	insinto /etc
	doins dmd.conf
	dobashcomp "${FILESDIR}/${PN}.bashcomp"

	# Compiler
	dobin "dmd"

	# Man pages, docs and samples
	cd ".." || die
	doman ../man/man1/dmd.1
	doman ../man/man1/dmd.conf.5

	use doc && dohtml -r ../html/*

	docompress -x /usr/share/doc/${PF}/samples/
	insinto /usr/share/doc/${PF}/samples/
	if use examples; then
		doins -r ../samples/d/*
	fi

	# druntime & Phobos
	if use amd64; then
		dolib.a "druntime/lib64/libdruntime.a"
		dolib.a "phobos/generated/linux/release64/libphobos2.a"
	fi
	if use x86 || (use amd64 && use multilib); then
		use amd64 && multilib_toolchain_setup x86
		dolib.a "druntime/lib32/libdruntime.a"
		dolib.a "phobos/generated/linux/release32/libphobos2.a"
		# TODO: restore target architecture
	fi

	# cleanup builds
	rm -r "druntime/obj"* "druntime/lib"* || die
	rm -r "phobos/generated" || die

	# remove files that are not required
	rm "phobos/posix.mak" || die
	rm "phobos/win32.mak" || die
	rm "phobos/std.ddoc" || die
	rm "phobos/index.d" || die
	rm -r "phobos/etc/c/zlib" || die

	# imports
	insinto /usr/include/druntime/
	doins -r druntime/import/*

	insinto /usr/include/phobos2
	doins -r phobos/*
}

pkg_postinst() {
	if use doc || use examples; then
		elog "The bundled docs and/or samples may be found in"
		elog "/usr/share/doc/${PF}"
	fi
}
