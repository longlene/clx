# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( 23 )
inherit llvm-r2 toolchain-funcs

DESCRIPTION="Simple imperative language statically typed with genericity"
HOMEPAGE="https://tibleiz.net/copper"
SRC_URI="https://tibleiz.net/download/copper-${PV}-src.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

PATCHES=(
	"${FILESDIR}"/${P}-makefile-cxx.patch
	"${FILESDIR}"/${P}-no-prestrip.patch
	"${FILESDIR}"/${P}-scripts-c17-and-cc.patch
)

DEPEND="
	$(llvm_gen_dep '
		llvm-core/llvm:${LLVM_SLOT}=
	')
	dev-libs/libffi:=
	sys-libs/ncurses:=
"
# The copper driver shells out to the system C compiler to link whatever it
# compiles, and the --cc backend compiles generated C with it, so a C compiler
# is needed at run time and not only at build time.
RDEPEND="
	$(llvm_gen_dep '
		llvm-core/llvm:${LLVM_SLOT}=
	')
	dev-libs/libffi
	sys-libs/ncurses
	sys-devel/gcc
"

src_prepare() {
	default
	# The driver adds this path to every compile unless COPPER_INCLUDE says
	# otherwise; the ebuild installs the standard library under ${EPREFIX}/usr.
	sed -i -e "s|/usr/local/share/copper/include|${EPREFIX}/usr/share/copper/include|" scripts/copper || die
}

src_compile() {
	# Not parallelisable: the 'compiler' target lists obj and link-$(BACKEND)
	# as prerequisites but link does not depend on obj, so with -j > 1 the
	# linker can run before copper.o exists.
	#
	# -std=gnu17 is the only flag added to CC: the bootstrap source is a
	# compiler emitted as C that uses identifiers named true and false, which
	# are keywords in C23 (the default since GCC 15).  Upstream compiles that
	# generated C without optimisation flags, and the Makefile assigns CFLAGS
	# itself, so make.conf flags stay out of the bootstrap either way.
	emake -j1 CC="$(tc-getCC) -std=gnu17" CXX="$(tc-getCXX)"
}

src_install() {
	# Upstream installs the copper driver plus copper-elf64, copper-llvm and
	# copper-c into bindir, libcopper-std.a into libdir (programs link against
	# -lcopper-std) and the standard library sources into
	# <datadir>/copper/include/std.
	emake install "prefix=${EPREFIX}/usr" "DESTDIR=${D}"
	dodoc LICENSE.txt README.txt
}
