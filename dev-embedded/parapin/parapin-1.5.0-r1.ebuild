# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/parapin/parapin-1.5.0-r1.ebuild,v 1.1 2005/01/30 03:50:15 TopoMorto Exp $

inherit toolchain-funcs
inherit eutils
inherit versionator

DESCRIPTION="A parallel port pin programming library"
HOMEPAGE="http://parapin.sourceforge.net/"
SRC_URI="mirror://sourceforge/sourceforge/${PN}/${P}.tgz"

LICENSE="LGPL-2.1"
IUSE="doc"
# it could run on ~amd64 but i havent tested it :))
KEYWORDS="~x86"  

SLOT="0"

DEPEND="doc? ( dev-tex/latex2html )"
RDEPEND=""

src_unpack()
{
	unpack ${A}
	cd ${S}


	local KV=$(uname -r)
	local KV_MAJOR=$(get_major_version ${KV})
	local KV_MINOR=$(get_version_component_range 2 ${KV})
	local KV_ALTRO=$(get_version_component_range 3 ${KV})

	local is_26=0

	if [[ "${KV_MAJOR}" == 2 ]] && [[ "${KV_MINOR}" == 6 ]]; then
		is_26=1
	fi

	if [[ "$is_26" == "0" ]]; then
		einfo "Building parapin ${PV} for the 2.4 Kernel Version"
		ewarn " NOT TESTED "
		ebeep
		bash "./setup-2.4.sh"  || die "Build failed!"
	fi

	if [[ "$is_26" == "1" ]]; then
		einfo "Building parapin ${PV} for the 2.6 kernel Version"
		bash "./setup-2.6.sh"  || die "Build failed!"
	fi
}

src_compile() {
	# Note 2.4 and 2.6 makefiles are identical for the targets used
	emake -f Makefile CC=$(tc-getCC) || die
}

src_install(){
	# ovveride the standard installer ....(?)
	insopts -o bin -g bin -m 644; insinto /usr/lib; doins libparapin.a
	insopts -o bin -g bin -m 444; insinto /usr/include; doins parapin.h

	dodoc README


	if use doc; then
		einfo "Buildinding and installing HTML docs"
		cd doc
		emake html
		cd parapin
		dohtml *.html *.css *.png

		cd ${S}
		docinto examples
		dodoc examples/*.c
	fi
}

