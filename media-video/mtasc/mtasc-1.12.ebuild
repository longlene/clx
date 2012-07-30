# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cvs versionator

ECVS_SERVER="cvs.motion-twin.com:/cvsroot"

DESCRIPTION="The Motion-Twin ActionScript 2 Compiler"
HOMEPAGE="http://www.mtasc.org"
SRC_URI="http://www.mtasc.org/doc/mtasc/install.ml"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/ocaml
	sys-libs/zlib"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/install.ml" .
	sed -i "/download();/d" install.ml
	
	for M in extlib-dev swflib extc; do
		ECVS_MODULE="ocaml/${M}"
		cvs_src_unpack
	done
	
	ECVS_MODULE="ocaml/mtasc"
	ECVS_BRANCH="v`replace_all_version_separators -`"
	cvs_src_unpack
}

src_compile() {
	ocaml install.ml || die "ocaml install failed" 
}

src_install() {
	# Don't install CVS directories.
	find ocaml/mtasc/std{,8} -name "CVS" -exec rm -rf {} \; 2> /dev/null
	
	dobin bin/mtasc bin/mtasc-byte
	insinto /usr/share/mtasc
	doins -r ocaml/mtasc/std{,8}
	dodoc ocaml/mtasc/doc/{Readme.linux,CHANGES.txt}
}

pkg_postinst() {
	einfo "mm classes are installed in /usr/share/mtasc/std"
	einfo "so when needed you should compile with:"
	einfo "mtasc -cp /usr/share/mtasc/std ..."
}
