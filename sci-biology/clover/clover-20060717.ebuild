# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="A program for identifying functional sites in DNA sequences"
HOMEPAGE="http://zlab.bu.edu/clover/"
BG_SEQ1="http://zlab.bu.edu/~mfrith/downloads/hs_chr20.mfa.gz"
BG_SEQ2="http://zlab.bu.edu/~mfrith/downloads/hs_upstream2000.fa.gz"
BG_SEQ3="http://zlab.bu.edu/~mfrith/downloads/hs_cpg.fa.gz"
BG_SEQ4="http://zlab.bu.edu/~mfrith/downloads/mm_chr19.mfa.gz"
BG_SEQ5="http://zlab.bu.edu/~mfrith/downloads/mm_upstream2000.fa.gz"
BG_SEQ6="http://zlab.bu.edu/~mfrith/downloads/dm_chr2R.fa.gz"
SRC_URI="http://zlab.bu.edu/~mfrith/downloads/clover-2006-07-17.tar.gz
	${BG_SEQ1}
	${BG_SEQ2}
	${BG_SEQ3}
	${BG_SEQ4}
	${BG_SEQ5}
	${BG_SEQ6}
"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86 ia64 amd64 alpha"
IUSE=""

DEPEND=""
RDEPEND=""
S=${WORKDIR}/clover-2006-07-17

src_unpack() {
	unpack ${A}
	sed -i \
	"s:g++:$(tc-getCXX):" \
	${S}/Makefile
	sed -i \
	"s:-Wall -O3:${CFLAGS}:" \
	${S}/Makefile
}

src_install() {
	dobin clover
	dodir "/usr/share/clover"
	insinto "/usr/share/clover"
	doins ${FILESDIR}/jaspar2005core
	doins ${WORKDIR}/*.fa
	doins ${WORKDIR}/*.mfa
}

pkg_postinst() {
	echo
	einfo "The motif library jaspar2005core has been"
	einfo "put at the following path:"
	einfo "/usr/share/clover/jaspar2005core"
	einfo "You always have to specify this when running clover"
	echo
	einfo "The following background sequences"
	einfo "files have been added into"
	einfo "/usr/share/clover"
	einfo "directory:"
	einfo "Human chromosome 20 (44.1% C+G): hs_chr20.mfa"
	einfo "Sequences 2000 bp upstream of human genes (49.8% C+G): hs_upstream2000.fa"
	einfo "Human CpG islands (68.8% C+G, median length = 557 bp): hs_cpg.fa"
	einfo "Mouse chromosome 19 (42.8% C+G): mm_chr19.mfa"
	einfo "Sequences 2000 bp upstream of mouse genes (47.8% C+G): mm_upstream2000.fa"
	einfo "Drosophila chromosome 2 arm R (43.5% C+G): dm_chr2R.fa"
	echo
}
