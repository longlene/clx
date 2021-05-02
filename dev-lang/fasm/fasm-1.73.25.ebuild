# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils toolchain-funcs

DESCRIPTION="The flat assembler is a fast and efficient self-assembling multi-platform 80x86 assembler."
HOMEPAGE="http://flatassembler.net"
SRC_URI="http://flatassembler.net/fasm-${PV}.tgz
libc? ( http://flatassembler.net/fasm-${PV}.tar.gz )"

LICENSE="fasm"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="+libc"
DEPEND="
libc? ( virtual/libc )"

S="${WORKDIR}/${PN}"

QA_TEXTRELS="usr/bin/*"
QA_EXECSTACK="
	/usr/bin/fasm
	/usr/bin/listing
	/usr/bin/prepsrc
	/usr/bin/symbols
"

src_unpack() {
	unpack ${A}
	use libc && unpack "fasm-${PV}.tar.gz"
}

src_prepare() {
	find examples -name '*.o' -exec rm {} \;
	find examples -type f -a -perm -o=rx -exec rm {} \;
}

src_compile() {
	local archflag
	use amd64 && archflag="-m32"
	mkdir bin
	if use libc ; then
		"${S}"/fasm source/libc/fasm.asm fasm.o > /dev/null
		$(tc-getCC) ${archflag} -o bin/${PN} fasm.o
	else
		"${S}"/fasm source/Linux/fasm.asm bin/fasm > /dev/null
	fi

	local s
	for s in listing prepsrc symbols; do
		./bin/fasm tools/libc/${s}.asm ${s}.o > /dev/null
		$(tc-getCC) ${archflag} -o bin/${s} ${s}.o
	done
}

src_install() {
	dobin bin/{fasm,listing,prepsrc,symbols}
	dodoc license.txt whatsnew.txt
	dodoc -r examples
}
