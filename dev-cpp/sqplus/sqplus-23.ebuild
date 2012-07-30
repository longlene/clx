# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An easy to use binding system for Squirrel"
HOMEPAGE="http://wiki.squirrel-lang.org/default.aspx/SquirrelWiki/SqPlus.html"
SRC_URI="http://www.brightland.com/sq/SQUIRREL2_1_1_sqplus_23.zip"
LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"
DEPEND="=dev-lang/squirrel-2.1.1"
RDEPEND="${DEPEND}"

S=${WORKDIR}/SQUIRREL2_1_0_sqplus_${PV}

src_unpack()
{
	unpack ${A} || die "unpacking ${A} failed"
	cd ${S}
	rm minimalSqPlus/{*.vcproj,*.sln,*.cbp}
	rm testSqPlus/{*.vcproj,*.sln,*.cbp}
	rm testSqPlus2/{*.vcproj,*.sln,*.cbp}
}

src_compile() {
	cd sqplus
	emake || die "emake failed"

}

src_install() {
	local dir=/usr
	insinto ${dir}/include/squirrel
	doins sqplus/{SqPlusConst.h,sqplus.h,SquirrelBindingsUtils.h,SquirrelObject.h,SquirrelVM.h} || die "copying header files failed"
	dolib lib/libsqplus.a || die "copying library file failed"
	dodoc README_SQPLUS.txt || die "copying documentation failed"

	if use examples ; then
		insinto /usr/share/doc/${PF}/samples
		doins -r minimalSqPlus testSqPlus testSqPlus2 || die "copying examples failed"
	fi
}
