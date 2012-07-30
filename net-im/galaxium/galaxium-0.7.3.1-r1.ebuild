# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools mono

DESCRIPTION="Multi-Protocol Instant Messenger"
HOMEPAGE="http://code.google.com/p/galaxium/"
SRC_URI="http://galaxium.googlecode.com/files/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="adium gecko msn webkit"

DEPEND=">=dev-lang/mono-1.2.4
		>=dev-dotnet/mono-addins-0.3
		>=dev-dotnet/gtk-sharp-2.10.2
        webkit? ( >=dev-dotnet/webkit-sharp-0.2 )
		gecko? ( dev-dotnet/gecko-sharp ) 
		dev-dotnet/libanculus-sharp"
RDEPEND="${DEPEND}
		media-libs/gstreamer
		x86? ( media-libs/swfdec )"

src_unpack() {

	unpack ${A}
	cd "${S}"
	eautoreconf

}

src_compile() {

	! use adium && myconf="${myconf} --disable-adium"

	use gecko && myconf="${myconf} --enable-gecko"

	! use webkit && myconf="${myconf} --disable-webkit"

	cd ${WORKDIR}/${P} && /bin/sh ${WORKDIR}/${P}/autogen.sh ${myconf} --prefix=/usr

	emake || die "emake failed"
}

src_install() {

	emake DESTDIR="${D}" install || die "Install failed"

}
