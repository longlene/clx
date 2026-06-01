# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Fast and efficient self-assembling x86 assembler"
HOMEPAGE="http://flatassembler.net"
SRC_URI="http://flatassembler.net/fasm-${PV}.tgz
	libc? ( http://flatassembler.net/fasm-${PV}.tar.gz )"

S="${WORKDIR}/${PN}"

LICENSE="fasm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libc"
RESTRICT="strip"

# libc build produces 32-bit binaries; requires multilib gcc on amd64
DEPEND="libc? ( virtual/libc )"

QA_TEXTRELS="usr/bin/*"
QA_EXECSTACK="
	usr/bin/fasm
	usr/bin/listing
	usr/bin/prepsrc
	usr/bin/symbols
"

src_unpack() {
	unpack "fasm-${PV}.tgz"
	use libc && unpack "fasm-${PV}.tar.gz"
}

src_prepare() {
	default
	find examples -name '*.o' -exec rm {} \;
	find examples -type f -a -perm -o=rx -exec rm {} \;
}

src_compile() {
	mkdir bin || die

	if use libc; then
		# 32-bit libc-linked build (requires multilib on amd64)
		"${S}"/fasm source/libc/fasm.asm fasm.o || die
		$(tc-getCC) -m32 -o bin/${PN} fasm.o || die
		local s
		for s in listing prepsrc symbols; do
			./bin/fasm tools/libc/${s}.asm ${s}.o || die
			$(tc-getCC) -m32 -o bin/${s} ${s}.o || die
		done
	elif use amd64; then
		"${S}"/fasm.x64 source/linux/x64/fasm.asm bin/fasm || die
	else
		"${S}"/fasm source/linux/fasm.asm bin/fasm || die
	fi
}

src_install() {
	dobin bin/fasm
	if use libc; then
		dobin bin/listing bin/prepsrc bin/symbols
	fi
	dodoc license.txt whatsnew.txt
	dodoc -r examples
}
