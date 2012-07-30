# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

LICENSE="fasm"
#KEYWORDS="~x86 ~amd64"
KEYWORDS="x86 amd64"
SLOT="0"
IUSE="rebuild no_usr_bin libc"
#Well, here's an (brief) explanation of the USE I use... (pun intended, you may not laught ;)
# IUSE
# rebuild   - rebuild fasm
# no_usr_bin       - don't add a symlink in /usr/bin/fasm -> /opt/fasm/fasm
# lib   - use the unix/libc version of fasm
#DEPEND="rebuild? ( >=dev-lang/fasm-1.57 )"
#DEPEND=">=dev-lang/fasm-1.57
DEPEND="
libc? ( virtual/libc )"

#note from ebuild writer: following line is used for rendering metadata.xml
#LONG_DESCRIPTION="The flat assembler is a fast and efficient self-assembling 80x86 assembler for DOS, Windows and Linux operating systems. Currently it supports all 8086-80486/Pentium instructions with MMX, SSE, SSE2, SSE3 and 3DNow! extensions, can produce output in binary, MZ, PE, COFF or ELF format. It includes the powerful but easy to use macroinstruction support and does multiple passes to optimize the instruction codes for size. The flat assembler is self-compilable and the full source code is included."
DESCRIPTION="The flat assembler is a fast and efficient self-assembling multi-platform 80x86 assembler."

HOMEPAGE="http://flatassembler.net"
SRC_URI="http://flatassembler.net/fasm-${PV}.tgz
libc? ( http://flatassembler.net/fasm-${PV}.tar.gz )"

S=${WORKDIR}

src_unpack() {
unpack ${A}
use libc && unpack "fasm-${PV}.tar.gz"

if use amd64 || use ~amd64 ; then
einfo "Notice: You'll need IA32 eumlation support since the fasm exuctable will be a 32-bit app."
fi
}
src_compile() {
if use rebuild || use libc ; then
if use libc ; then
einfo "Rebuilding libc fasm..."
echo -n "fasm.o..."
${S}/fasm/fasm ${S}/fasm/source/libc/fasm.asm ${S}/fasm/fasm.o > /dev/null
rm ${S}/fasm/fasm
echo -e "\bdone!"
echo -n "fasm..."
if use amd64 || use ~amd64 ; then
`tc-getCC` -m32 ${S}/fasm/fasm.o -o ${S}/fasm/fasm
else
`tc-getCC` ${S}/fasm/fasm.o -o ${S}/fasm/fasm
fi
if [ $? != 0 ] || [ ! -e ${S}/fasm/fasm ] ; then
eerror "Building failed!"
die "Building failed!"
fi
#rm ${S}/fasm/fasm.o
else
echo -n "fasm..."
${S}/fasm/fasm ${S}/fasm/source/Linux/fasm.asm ${S}/fasm/fasm.2
mv ${S}/fasm/fasm.2 ${S}/fasm/fasm
fi
echo -e "\bdone!"
fi
einfo "Portage will whine about QA on executeable stacks - ignore them untill I find out how to make portage stfu."
}

src_install() {
#${D} = virutal /
dodir /opt/fasm
mv -v ${S}/fasm/* ${D}opt/fasm/ | sed -e s:"$S":"\$S": -e s:"$D":"\$D/":
# adjust permissions.
find ${D}opt/fasm \( -iname '*.txt' -or -iname '*.asm' -or -iname '*.inc' -or -iname '*.o' \) -exec chmod 774 {} \;
chmod 775 ${D}opt/fasm/fasm ${D}opt/fasm/examples/elfexe/hello
find ${D}opt/fasm -type d -exec chmod 775 {} \;

#@gen2 devs: it this "legal" for ebuilds? (ie is there anyway to make it do the symlink like: ln -s ${WILL_BE_MY_ROOT}/opt/fasm ${D}usr/bin/fasm).
dodir /usr/bin
if use !no_usr_bin ; then
ln -s /opt/fasm/fasm ${D}usr/bin/fasm
fi
}
