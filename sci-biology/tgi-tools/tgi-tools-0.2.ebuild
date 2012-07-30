# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The TIGR Gene Indices Clustering Tools (TGICL) for genomic data processing: tgicl, seqclean, cln2qual, mdust, trimpoly, zmsort, tclust, sclust, cdbfasta, psx"
HOMEPAGE="http://compbio.dfci.harvard.edu/tgi/software/"

for i in seqclean/{mdust,seqclean,seqcl_scripts,trimpoly} cdbfasta/cdbfasta \
	tgicl/{mgblast,nrcl,psx,pvmsx,sclust,tclust,tgi_cpp_library,tgicl_linux,tgicl_scripts,zmsort} \
	clview/clview_src clview/clview_linux_i386; do
	SRC_URI="${SRC_URI} ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/${i}.tar.gz"
done

LICENSE="Artistic"
SLOT="0"
IUSE="pvm"
KEYWORDS="~x86 ~amd64"

DEPEND="pvm? ( sys-cluster/pvm )
	x11-libs/fox"

# mgblast needs old version of ncbi-tools unpacked and compiled during its own compilation
# from newer tools you need to include blfmtutl.h but the next error is no go for me:
#   mgblast.c:2205: error: too few arguments to function ‘BXMLBuildOneQueryIteration’

# Quoting from mgblast/README: the present package was built and tested only with the release 20060507
RDEPEND="${DEPEND}
	sci-biology/ncbi-tools
	sci-biology/cap3-bin
	dev-lang/perl"

S=${WORKDIR}

src_unpack() {
	unpack {nrcl,sclust,tclust,zmsort,mdust,seqclean,seqcl_scripts,trimpoly,cdbfasta,mgblast,tgi_cpp_library,tgicl_linux,tgicl_scripts,clview_src}.tar.gz
	for i in psx pvmsx; do
		mkdir "${S}"/${i}
		cd "${S}/${i}"
		unpack ${i}.tar.gz
		cd ..
	done
	cd clview
	unpack clview_linux_i386.tar.gz
	cd ..
	mv mgblast/makefile mgblast/Makefile 2>/dev/null || true
}

src_compile() {
	einfo "Optionally, you might want to download UniVec from NCBI if you do not have your own"
	einfo "fasta file with vector sequences you want to remove from sequencing"
	einfo "reads. See http://www.ncbi.nlm.nih.gov/VecScreen/UniVec.html"

	# disable the necessity to install Mailer.pm with this tool
	einfo "Disabling mailer feature within seqclean"
	sed -i 's/use Mailer;/#use Mailer;/' seqclean/seqclean

	######################################################################
	# clview with tgi_cl/gcl stuff cannot be compiled
	#
	# FIXME: we have to run `/usr/bin/fox-config --cflags' to yield
	#        `-I/usr/include/fox-1.6'
	# similarly `fox-config --libs' to yield e.g.
	# `-lFOX-1.6 -lXext -lX11 -lXft -lXrender -lfontconfig -lfreetype -lz -lX11
	# -lXcursor -lXrandr -ldl -lpthread -lrt -ljpeg -lpng -ltiff -lz -lbz2 -lm
	# -lcups -lnsl -lGLU -lGL'
	FOXVERSION=`WANT_FOX="1.6" fox-config --version`
	FOXPREFIX=`WANT_FOX="1.6" fox-config --prefix`
	FOXINCPATH=`WANT_FOX="1.6" fox-config --cflags`
	FOXLIBS=`WANT_FOX="1.6" fox-config --libs`
	einfo "Discovered path to fox ${FOXVERSION} files: ${FOXINCPATH}\n${FOXLIBS}"

	sed -i "s#FOXPREFIX = /mylocal/geo#FOXPREFIX = ${FOXPREFIX}#" clview/Makefile || die "Failed to hack FOXPREFIX in clview/Makefile"
	sed -i "s#FOXINCDIR := .*#FOXINCDIR := ${FOXINCPATH}#" clview/Makefile || die "Failed to hack FOXINCDIR in clview/Makefile"
	sed -i "s#-I\${FOXINCDIR}#\${FOXINCDIR}#" clview/Makefile || die "Failed to revert the extra -I we introduced on a previous line to clview/Makefile"
	sed -i "s#FOXLIBDIR := .*#FOXLIBDIR := ${FOXPREFIX}/lib#" clview/Makefile || die "Failed to hack FOXLIBDIR in clview/Makefile"
	sed -i "s#LOADLIBS :=.*#LOADLIBS := ${FOXLIBS}#" clview/Makefile || die "Failed to hack LOADLIBS in clview/Makefile"
	sed -i "s#-I-#-I #" clview/Makefile

	# see tgi_cl/gcl/
	sed -i "s#TGICLASSDIR := /tucan/geo/src/tgi_cl#TGICLASSDIR := ../tgi_cl#" clview/Makefile || die
	cd ${S}/clview
	# is used in conjunction with clview_src.tar.gz
	make
	cd ..
	######################################################################



	# mgblast cannot be compiled against newer ncbi-tools but let's try
	sed -i 's#/usr/local/projects/tgi/ncbitoolkit/ncbi#/usr#' mgblast/Makefile
	sed -i 's#NCBIDIR = /mylocal/src/ncbi#NCBIDIR = /usr#' mgblast/Makefile
	sed -i 's#NCBI_INCDIR = .*#NCBI_INCDIR = /usr/include/ncbi#' mgblast/Makefile
	sed -i 's#NCBI_LIBDIR = .*#NCBI_LIBDIR = /usr/lib#' mgblast/Makefile # a PATH to NCBI-TOOLKIT (/usr/lib) while NOT /usr/lib/ncbi-tools++ !
	sed -i "s#-I-#-iquote#" mgblast/Makefile
	cd ${S}/mgblast
	make || cp ../tgicl_linux/bin/mgblast .
	cd ..

	sed -i 's#GCLDIR := ../gclib#GCLDIR := ../cdbfasta/gclib#' nrcl/Makefile
	sed -i 's#GCLDIR := ../gclib#GCLDIR := ../cdbfasta/gclib#' sclust/Makefile
	sed -i 's#GCLDIR := ../gclib#GCLDIR := ../cdbfasta/gclib#' tclust/Makefile
	sed -i 's#GCLDIR := ../gclib#GCLDIR := ../cdbfasta/gclib#' zmsort/Makefile
	sed -i 's/-V\t\tverbose/-V\t\tverbose\\/' zmsort/zmsort.cpp

	# the PVM-related binaries are compiled only when PVM is installed but
	# anyway, the binaries are available in tgicl_linux/bin/ just in case
	for i in nrcl cdbfasta mdust psx sclust tclust trimpoly zmsort $(use pvm && echo pvmsx); do
		sed -i 's/CFLAGS[ ]*=/CFLAGS :=/; s/-D_REENTRANT/-D_REENTRANT \${CFLAGS}/; s/CFLAGS[ ]*:=[ ]*-O2$//' \
			${S}/${i}/Makefile
		sed -i "s#-I-#-iquote#" ${S}/${i}/Makefile
		cd "${S}/${i}" || die "cd ${i} failed"
		emake || die "emake failed in ${i}"
	done
}

src_install() {
	dobin cdbfasta/{cdbfasta,cdbyank}
	dobin seqclean/{seqclean,cln2qual,bin/seqclean.psx}
	dobin tgicl_scripts/tgicl tgicl_scripts/bin/tgicl_asm.psx tgicl_scripts/bin/tgicl_cluster.psx
	
	# an old version of cap3 is available but we REQUIRE sci-biology/cap3-bin
	# newbin tgicl_linux/bin/cap3 /usr/bin/cap3.old

	for i in mgblast mdust psx sclust tclust trimpoly zmsort $(use pvm && echo pvmsx); do
		dobin ${i}/${i}
	done
	for i in cdbfasta seqclean tgicl_linux mgblast trimpoly tgicl_scripts; do
		newdoc ${i}/README README.${i}
	done

	# install at least the binaries for clview when we cannot compile it
	dobin clview/clview
	dolib clview/libFOX-1.0.so.0
	dolib clview/libFOX-1.0.so.0.0.3
}

