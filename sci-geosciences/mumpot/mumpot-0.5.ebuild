
DESCRIPTION="OSM map viewing, routing and simple editing program"
HOMEPAGE="http://www.mumpot.org/"
SRC_URI="http://www.mumpot.org/download/${P}.tar.gz"
LICENSE="GPL-3"
IUSE="nls curl"
SLOT="0"
KEYWORDS="~x86"
DEPEND="dev-libs/libxml2
		>=x11-libs/gtk+-2
		media-libs/libpng
		media-libs/jpeg
		app-arch/bzip2
		net-wireless/bluez-libs
		curl? ( net-misc/curl ) 
		nls? ( sys-devel/gettext )"


src_compile() {
# libcurl is needed for uploading data to OSM
	if use curl; then
	  OSM_UPLOAD=
	else
	  OSM_UPLOAD=--disable-osmupload
	fi
	econf $(use_enable nls) $OSM_UPLOAD || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README || die "dodoc failed"
}


