# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs
inherit perl-module

DESCRIPTION="ESTScan can detect coding regions in DNA/RNA sequences, even if they are of low quality (e.g. EST sequences). ESTScan will also detect and correct sequencing errors that lead to frameshifts."
HOMEPAGE="http://sourceforge.net/projects/estscan/"
SRC_URI="http://downloads.sourceforge.net/estscan/estscan-3.0.2.tar.gz
		http://downloads.sourceforge.net/estscan/At.smat.gz
		http://downloads.sourceforge.net/estscan/Dm.smat.gz
		http://downloads.sourceforge.net/estscan/Dr.smat.gz
		http://downloads.sourceforge.net/estscan/Hs.smat.gz
		http://downloads.sourceforge.net/estscan/Mm.smat.gz
		http://downloads.sourceforge.net/estscan/Rn.smat.gz
		http://downloads.sourceforge.net/estscan/user_guide_fev_07.pdf
		http://downloads.sourceforge.net/estscan/BTLib-0.18.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="fortran icc"

DEPEND=""

RDEPEND=""

S="${WORKDIR}"

src_compile() {
	#
	sed -e 's/\\rm -f/rm -rf/' \
		-e 's/^ LDFLAGS = -lm/LDFLAGS = -lm/' -i "${P}"/Makefile

	# fix hard-coded paths
	sed -e 's+/usr/molbio/share/ESTScan+/usr/share/ESTscan+' -i "${P}"/estscan.c
	sed -e 's+/usr/molbio/share/ESTScan+/usr/share/ESTscan+' -i "${P}"/estscan.spec

	if ! use icc; then
		sed -e 's/^ CFLAGS = -O2/ CFLAGS = ${CFLAGS}/' \
			-e 's/^ FFLAGS = -O2/ FFLAGS = ${FFLAGS}/' \
			-e "s/^ F77 = g77/F77 = $(tc-getF77)/" -i "${P}"/Makefile \
			|| die "blah"
	else
		# FIXME: I would use $(tc-getCC) instead of hard-coded icc but it gives
		# me gcc instead, same for $(tc-getF77)
		# Moreover, the if/else logic here should separate users having only icc
		# while not ifort (and vice-versa) from those having only
		# gcc/gfortran/g77
		#
		# FIXME: below as a dirty hack I force gfortran instead of ifort for
		# my testing purposes. Didn't ebuild contain "PROVIDES" line?
		# Same for FFLAGS.
		sed -e "s:^# CC = icc:CC = icc:" \
		    -e "s:^# CFLAGS = -O3 -ipo -axP:CFLAGS = -O3 -ipo -axP:" \
			-e "s:^# FFLAGS = -O3 -ipo -axP:#FFLAGS = -O3 -ipo -axP:" \
			-e "s/^ CFLAGS = -O2/#CFLAGS = -O2/" \
			-e "s/^# F77 = ifort/F77 = gfortran/" \
			-e "s/^ FFLAGS = -O2/FFLAGS = -O2/" \
			-e "s/^ CC = gcc/# CC = gcc/" \
			-e "s/^ F77 = g77/# F77 = g77/" -i "${P}"/Makefile || die "b"
	fi
	cd "${P}"
	emake

	cd ../BTLib-0.18
	perl Makefile.PL
}

src_install() {
	# FIXME: Some kind of documentation is in {P}/estscan.spec
	cd "${P}"
	dobin build_model estscan evaluate_model extract_EST extract_UG_EST extract_mRNA makesmat maskred prepare_data winsegshuffle 
	# the file build_model_utils.pl should go into some PERL site-packages dir
	# see {P}/estscan.spec

	# install the doc (but is not in ${WORKDIR} because src_UNPACK() failed on it
	cd ${WORKDIR}
	insinto /usr/doc/ESTscan
	# grab the file directly from ../distdir/
	doins ../distdir/user_guide_fev_07.pdf

	# install the default precomputed matrices
	cd ${WORKDIR}
	insinto /usr/share/ESTscan
	doins *.smat

	# install BTlib (in perl)
	cd BTLib-0.18
	dobin fetch indexer netfetch
	insinto /usr/share/ESTscan/
	doins fetch.conf

	# FIXME: install the *.pm files from BTLib-0.18
	myinst="DESTDIR=${D}"
	perl-module_src_install

	einfo "Please edit /usr/share/ESTscan/fetch.conf to fit your local database layout."
	einfo "Also create your own scoring matrices and place them into /usr/share/ESTscan/."
	einfo "You may follow the hints from http://estscan.sourceforge.net/"
}
