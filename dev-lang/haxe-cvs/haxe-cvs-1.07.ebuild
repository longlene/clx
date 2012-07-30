# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_SERVER="cvs.motion-twin.com:/cvsroot"

inherit eutils cvs

DESCRIPTION="An object-oriented universal language for JavaScript, Flash, and Neko."
HOMEPAGE="http://haxe.org/"
SRC_URI="http://haxe.org/_media/install.ml"

LICENSE="GPL"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/ocaml sys-libs/zlib"
RDEPEND=""
S="${WORKDIR}"

src_unpack() {
	# modules are checked out in install.ml as:
	#   cvs motiontwin "co [modulename]";
	# so, this extracts [modulename]
	local modules=`sed -n -e 's/.*motiontwin "co \(.*\)".*/\1/p' ${DISTDIR}/${A}` 
	
	for i in ${modules}; do
		ECVS_MODULE="${i}" cvs_src_unpack
	done
}

src_compile() {
	# remove download call from install
	# instead checkout was done with cvs_src_unpack
	grep -v 'download();' haxe/doc/${A} > ${A} || die "couldn't copy new ${A} from cvs"

	ocaml ${A} || die "failed ocaml install script"
}

src_install() {
	dobin bin/*
	dodir /usr/lib/haxe/std
	cp -pPR haxe/std ${D}/usr/lib/haxe/
	dodoc haxe/doc/*.txt

	local envfilename="50haxe"
	echo "HAXE_LIBRARY_PATH=/usr/lib/haxe/std:." > ${envfilename}
	doenvd ${envfilename}
}
