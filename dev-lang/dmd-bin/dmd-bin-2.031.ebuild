# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/dmd/dmd-2.031.ebuild$

inherit eutils

MY_P=${P/-bin/}
MY_P=${MY_P/-/.}

DESCRIPTION="Digital Mars D Compiler"
HOMEPAGE="http://www.digitalmars.com/d/"
SRC_URI="http://ftp.digitalmars.com/${MY_P}.zip"

IUSE=""
LICENSE="DMD, GPL, Boost"
RESTRICT="mirror strip binchecks"
SLOT="0"
KEYWORDS="~amd64 ~x86"

LOC="/opt/dmd"
S="${WORKDIR}"

DEPEND="sys-apps/findutils
	app-arch/unzip"
RDEPEND="amd64? ( app-emulation/emul-linux-x86-compat )
	x86? ( sys-libs/libstdc++-v3 )"

src_unpack() {
	unpack ${A}

	# Cleanup line endings
	cd "${S}/dmd2"
	edos2unix `find . -name '*.c' -type f`
	edos2unix `find . -name '*.d' -type f`
	edos2unix `find . -name '*.ddoc' -type f`
	edos2unix `find . -name '*.h' -type f`
	edos2unix `find . -name '*.mak' -type f`
	edos2unix `find . -name '*.txt' -type f`
	edos2unix `find samples -name '*.html' -type f`
	edos2unix src/phobos/linux.mak src/phobos/etc/c/zlib/linux.mak
	edos2unix src/druntime/src/dmd-posix.mak
	edos2unix src/druntime/src/common/posix.mak
	edos2unix src/druntime/src/compiler/dmd/posix.mak
	edos2unix src/druntime/src/gc/stub/posix.mak src/druntime/src/gc/basic/posix.mak

	# Fix permissions and clean up
	cd "linux"
	fperms guo=r `find . -type f`
	fperms guo=rx `find . -type d`
	fperms guo=rx bin/dmd bin/dumpobj bin/obj2asm bin/rdmd

	# This hack is better than actually patching the files that include with a
	# wrong path. It is linking the path were the files actually are to where
	# they are supposed to be. It might be interesting to discuss this topic.
	cd "${S}/dmd2/src/dmd"
	ln -s . mars
}

src_compile() {
	# Build the compiler. Can't use emake, customized build system
	cd "${S}/dmd2/src/dmd"
	make -f linux.mak

	# Copy the generated bins into its right place
	cp -f dmd idgen impcnvgen optabgen "${S}/dmd2/linux/bin"

	# Create a dmd.conf for compiling druntime (runtime environment) and phobos
	# (standard library) using the bundled druntime and phobos
	cat <<END > "dmd.conf"
[Environment]
DFLAGS=-I%@P%/../phobos -I%@P%/../druntime/import -L-L%@P%/../lib
END

	# Add the current directory to path, to allow using the newly built compiler
	# for building druntime and phobos
	export PATH=`pwd`:$PATH

	# Compile druntime (runtime environment)
	cd "${S}/dmd2/src/druntime/src"
	make -f dmd-posix.mak || die "Make druntime failed"
	chmod 644 ../import/core/*.di
	chmod 644 ../import/core/sync/*.di

	# Substitute with the bundled druntime
	rm -R "${S}/dmd2/linux/lib"
	cp -R ../lib "${S}/dmd2/linux/"

	# Compile the phobos standard library
	cd "${S}/dmd2/src/phobos"
	make -f linux.mak || die "Make phobos failed"
	cp obj/posix/release/libphobos2.a "${S}/dmd2/linux/lib"
}

src_install() {
	cd "${S}/dmd2"

	# Build new dmd.conf
	cat <<END > "dmd.conf"
[Environment]
DFLAGS=-I/usr/include/dmd2/phobos -I/usr/include/dmd2/druntime/import -L-L/usr/lib32/dmd2/lib
END
	insinto /etc
	doins dmd.conf

	# Man pages
	doman man/man1/dmd.1
	doman man/man1/dumpobj.1
	doman man/man1/obj2asm.1
	doman man/man1/rdmd.1
	doman man/man1/dmd.conf.5

	# Documentation
	dohtml "html/d/*" "html/d/phobos/*"

	# Install
	exeinto /usr/bin
	doexe linux/bin/dmd
	doexe linux/bin/dumpobj
	doexe linux/bin/obj2asm
	doexe linux/bin/rdmd

	dodir /usr/lib32/dmd2
	mv "${S}/dmd2/linux/lib" "${D}/usr/lib32/dmd2"

	dodir /usr/share/dmd2
	mv "${S}/dmd2/samples/" "${D}/usr/share/dmd2"


	# Phobos and druntime imports
	dodir /usr/include/dmd2/phobos
	mv "${S}/dmd2/src/phobos/std" "${S}/dmd2/src/phobos/etc" "${S}/dmd2/src/phobos/crc32.d" "${S}/dmd2/src/phobos/phobos.d" "${S}/dmd2/src/phobos/unittest.d" "${D}/usr/include/dmd2/phobos"

	dodir /usr/include/dmd2/druntime
	mv "${S}/dmd2/src/druntime/import/" "${D}/usr/include/dmd2/druntime"
}

pkg_postinst () {
	einfo "The bundled samples and sources may be found in  "
	einfo "/usr/share/dmd2                                  "
	einfo "                                                 "
}

