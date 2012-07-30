# $Header

inherit eutils toolchain-funcs

DESCRIPTION="The fastest open-source compression/decompression library"
HOMEPAGE="http://www.quicklz.com"
# if you know a better download url WITH FIXED VERSION NUMBER,
#                                                  you are welcome ...
SRC_URI="$HOMEPAGE/qpress-037-source.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
# maybe install static library too? not implemented
#USE="static" 

src_compile() {
 $(tc-getCC) $CFLAGS quicklz.c -c -o libquicklz.o || die
}

src_install() {
 dolib libquicklz.o
 insinto /usr/include
 doins quicklz.h
 einfo
 einfo "         quicklz library should be faster than lzo,"
 einfo " ** install app-arch/tamp and app-arch/lzop to benchmark **"
 einfo
}
