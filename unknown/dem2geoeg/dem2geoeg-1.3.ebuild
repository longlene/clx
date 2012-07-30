inherit eutils toolchain-funcs

DESCRIPTION="program to convert USGS Digital Elevation Model (DEM) data into a VRML .wrl file that uses the GeoVRML GeoElevationGrid"
HOMEPAGE="http://www.geovrml.org/software/dem2geoeg/"
SRC_URI="http://www.geovrml.org/software/dem2geoeg/src/${PN}.c"

LICENSE="public-domain"
KEYWORDS="x86"
IUSE=""

DEPEND=""

S=${WORKDIR}/

src_unpack() {
	cp $DISTDIR/dem2geoeg.c ${S}
}

src_compile() {
	cd ${S}
	$(tc-getCC) ${PN}.c -o ${PN} ${CFLAGS} ${LDFLAGS} || die "compile failed"
}

src_install() {
	dobin ${PN} || die "dobin failed"
}
