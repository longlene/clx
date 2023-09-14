
inherit toolchain-funcs

DESCRIPTION="Multi-threaded compressor, many times faster than lzop"
HOMEPAGE="http://blogs.sun.com/timc"
SRC_URI="$HOMEPAGE/resource/$P-source.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="doc"

DEPEND="dev-libs/quicklz"
RDEPEND="$DEPEND"

src_compile() {
 sed Makefile.linux \
  -e "s:-m32:$CFLAGS:g" \
  -e s-quicklz.o.:.*-- \
  -e s=quicklz.h=/usr/include/quicklz.h= \
  -e s=quicklz.o=/usr/$(get_libdir)/libquicklz.o= \
   > makefile
 export CC=$(tc-getCC)
 emake
}

src_install() {
 dobin $PN || die
 doman $PN.1 || die
 use doc &&
  dodoc README
}
