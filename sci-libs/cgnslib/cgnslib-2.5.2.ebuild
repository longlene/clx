# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P="${PN}_$(replace_version_separator 2 '-')"

DESCRIPTION="The CFD General Notation System (CGNS) is a standard for CFD data."
HOMEPAGE="http://www.cgns.org/"
SRC_URI="mirror://sourceforge/cgns/${MY_P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fortran hdf5 szip zlib"

RDEPEND="hdf5? ( sci-libs/hdf5 )
	zlib? ( sys-libs/zlib )
	szip? ( sci-libs/szip )"
DEPEND="${RDEPEND}"

MY_S="${PN}_$(get_version_component_range 1-2)"
S=${WORKDIR}/${MY_S}

src_compile() {
	sed -i -e "s| g77 | gfortran |" \
	-e 's|-Wl,-rpath,$cgnsdir/\\$(SYSTEM)|-Wl,-soname,libcgns.so|' \
	-e 's|-Wl,-R,$cgnsdir/\\$(SYSTEM)|-Wl,-soname,libcgns.so|' "${S}"/configure

	sed -i -e "s|@STRIP@|true|" "${S}"/make.defs.in

	local myconf="--enable-gcc --enable-lfs --enable-shared"
	use amd64 && myconf="${myconf} --enable-64bit"

	econf \
		${myconf} \
		$(use_with fortran) \
		$(use_with hdf5) \
		$(use_with zlib) \
		$(use_with szip)

	emake || die "emake failed"
}

src_install() {
	if use amd64 ; then
		local machine=`${S}/cgsystem -64`
	else
		local machine=`${S}/cgsystem`
	fi

	dolib "${S}"/"${machine}"/*.so
	dobin "${S}"/"${machine}"/hdf2adf
	dobin "${S}"/"${machine}"/adf2hdf
	insinto /usr/include
	doins cgnslib.h cgnslib_f.h cgnswin_f.h
}
