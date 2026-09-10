# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="nls ssl static-libs"

DEPEND="
	ssl? ( dev-libs/openssl:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
"

src_prepare() {
	default
	# Only if configure.ac was patched or autogen.sh needs running:
	# eautoreconf
}

src_configure() {
	local econfargs=(
		$(use_enable nls)
		$(use_enable static-libs static)
		$(use_with ssl openssl)
	)
	econf "${econfargs[@]}"
}

src_install() {
	default
	# Remove libtool archives:
	find "${D}" -name "*.la" -delete || die
}
