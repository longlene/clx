# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Small, fast, self-hosting C compiler for x86-64 and ARM64 Linux"
HOMEPAGE="https://github.com/Dom-Yan/Mucc https://dom-yan.github.io/Mucc/"
SRC_URI="https://github.com/Dom-Yan/Mucc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Mucc-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="sys-devel/gcc"
# The stage 1 binary is linked against the system C library
RDEPEND="elibc_glibc? ( sys-libs/glibc:= )"

# Stage 1: the compiler itself, built by the system C compiler. The
# Makefile hardcodes its own CFLAGS (including -g), so portage strips
# the binary at merge.
src_compile() {
	emake
}

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr"
}

src_test() {
	emake test
}
