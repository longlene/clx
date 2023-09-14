# file media-video/mmsrip-0.7.0.ebuild
# Distributed under the terms of the GNU General Public License v2
# Aurelien Requiem

DESCRIPTION="Command line utility to rip MMS streams"
HOMEPAGE="http://nbenoit.tuxfamily.org/projects.php?rq=mmsrip"
SRC_URI="http://nbenoit.tuxfamily.org/projects/mmsrip/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc x86"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND="virtual/libc"

src_compile() {
         econf \
                 $(use_enable static) \
                 || die
         make clean || die
         make || die
}

src_install() {
         dodir /usr/bin
         dobin src/mmsrip
         chmod 755 ${D}/usr/bin/mmsrip
         doman doc/mmsrip.1
         chmod 644 ${D}/usr/share/man/man1/mmsrip.1

         einstall || die "Installation failed"
         dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README
}
