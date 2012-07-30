# $Header: $

# see b.g.o bug 76484
# set environment variable CLENS_PROFILE="/usr/share/ptlens/profiles" for use with clens

inherit cvs

ECVS_SERVER="panotools.cvs.sourceforge.net:/cvsroot/panotools"
ECVS_MODULE="clens"
# There is no 0.3.1 branch, we use a date instead
ECVS_CO_OPTS="-D 6/19/06"
ECVS_UP_OPTS="-dP -D 6/19/06"

DESCRIPTION="A command-line version of PTLens"
SRC_URI=""
HOMEPAGE="http://panotools.sf.net"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="media-gfx/ptlens-profiles
		>=media-libs/libpano12-2.8.4"

PTLENS_PROFILES="/usr/share/ptlens/profiles/profile.txt"

S=${WORKDIR}/${ECVS_MODULE}

src_compile() {
	./bootstrap || die "bootstrap failed"
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR=${D} install
	dodir /etc/env.d
	echo "CLENS_PROFILE=\"${PTLENS_PROFILES}\"" > ${D}/etc/env.d/99clens
}
