# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="TGI utils"
LICENSE="Artistic"
HOMEPAGE="http://compbio.dfci.harvard.edu/tgi/software/"
SLOT="0"
IUSE=""
KEYWORDS="~x86"

RESTRICT="nomirror"

for i in seqclean/{seqclean,mdust,trimpoly} cdbfasta/cdbfasta tgicl/{psx,pvmsx,zmsort,tclust,sclust,nrcl,tgi_cpp_library}; do
	SRC_URI="${SRC_URI} ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/${i}.tar.gz";
done

DEPEND=""
RDEPEND=${DEPEND}
S=${WORKDIR}

src_unpack() {
	unpack {seqclean,mdust,trimpoly,cdbfasta,tgi_cpp_library}.tar.gz
	for i in nrcl sclust tclust zmsort psx pvmsx; do
		mkdir ${S}/${i}; cd ${S}/${i}; unpack ${i}.tar.gz
	done
}

src_compile() {
	sed -i 's/use Mailer;/#use Mailer;/' ${S}/seqclean/seqclean
	sed -i 's/-V\t\tverbose/-V\t\tverbose\\/' zmsort/zmsort.cpp
	for i in psx cdbfasta mdust sclust tclust trimpoly zmsort; do
		sed -i 's/CFLAGS[ ]*=/CFLAGS :=/; s/-D_REENTRANT/-D_REENTRANT \${CFLAGS}/; s/CFLAGS[ ]*:=[ ]*-O2$//' ${S}/${i}/Makefile
	done
	# TODO: fix errors in nrcl, pvmsx
	for i in cdbfasta mdust psx sclust tclust trimpoly zmsort; do
		(cd ${S}/${i}; emake) || die
	done
}

src_install() {
	dobin cdbfasta/{cdbfasta,cdbyank} mdust/mdust psx/psx sclust/sclust tclust/tclust trimpoly/trimpoly seqclean/{seqclean,cln2qual,bin/seqclean.psx} zmsort/zmsort
}
