# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

# The ridiculous version number is due to the strange naming of files from
# author: he put asl-1.41r8.tar.gz vs asl-current-142-bld16.tar.gz ... so, for
# futur compaitibility, just in case this guy ever imagines things like
# asl-142-al1.tar.gz , I thought adding extra "0.0" may be a way to anticipate
# conflictuous Gentoo enuild numbers:
# 0.0 for current-build
# 0.1 for currect-alpha (if ever)
# 1.0.x for asl-1.42.alphax
# 1.1.x for asl-1.42.betax
# 1.999.x for asl-1.42.x
# I fear the worse.

# These "current-build" seem to be consider as unstable; thus ~arch below

PN_=asl
#PV_=`echo ${PV} | sed 's/\.\([^.]*\)\.\([^.]*\)$/.\1r\2/'`
# 
PV_=`echo ${PV} | sed 's/\([^.]*\)\.\([^.]*\)\.\([^.]*\)\.\([^.]*\)\.\([^.]*\)$/current-\1\2-bld\5/'`
P_=${PN_}-${PV_}
#S=${WORKDIR}/${P_}
S=${WORKDIR}/asl-current

DESCRIPTION="The Macroassembler AS (compatible with more than 20 *famillies* of processors)"
HOMEPAGE="http://john.ccac.rwth-aachen.de:8000/as/"
SRC_URI="http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/${P_}.tar.gz"
#SRC_URI="mirror://sourceforge/monitor-68hc08/${P}.tgz"

LICENSE="free_use"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""


src_unpack() {
	unpack ${A}
}

src_configure() {
	ewarn
	ewarn "Selecting x86 compatible configuration"
	ewarn "Hardcoded plateform"
	ewarn "auto-detection of platform in later ebuild"
	ewarn
	ewarn "Documentation will be in at"
	ewarn "/usr/share/doc/m-asl-1.45.8/README.gz TODO: update"
	ewarn "or"
	ewarn "http://john.ccac.rwth-aachen.de:8000/as/"
	ewarn
	ewarn "This ebuild does not support distcc TODO: test it"
	ewarn
	ewarn "Man pages may not be installed at the right place"
	ewarn
	ebeep 3
	epause 3
	cp Makefile.def-samples/Makefile.def-i386-unknown-linux2.x.x Makefile.def || die "configuration failed (1)"

	ewarn "removing deprecated \"-mcpu=\" GCC option"	
	TMP_=`sed "s/^\(CFLAGS\)\([^.]*\)-mcpu=\([^. ]*\) \([^.]*\)$/\1\2\4/" Makefile.def` || die "configuration failed (2)"
	echo "${TMP_}" > Makefile.def || die "configuration failed (3)"
	ewarn "Adding \$CFLAGS from /etc/make.conf"
	TMP_=`sed "s/^CFLAGS\([^.]*\)\$/CFLAGS\1 $CFLAGS/" Makefile.def` || die "configuration failed (4)"
	echo "${TMP_}" > Makefile.def || die "configuration failed (5)"
#	d=${D}
	for i in BINDIR INCDIR MANDIR LIBDIR DOCDIR ;
	do
		einfo "Updating $i"
		TMP_=`sed "s|^$i\([^.]*\)\(\/usr\/local\/\)\([^.]*\)\$|$i\1\/usr\/\3|" Makefile.def` || die "configuration failed (6)"
		echo "${TMP_}" > Makefile.def || die "configuration failed (7)"
#		echo "$i $d"
	done
#should manpages be put in /usr/share/man/ ?
}


src_compile() {
	src_configure
	emake || die "emake failed"
}

src_install() {
	make PREFIX="$D" install || die "install failed"
}
