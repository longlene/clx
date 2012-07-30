# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Soundcard Oscilloscope for X"
HOMEPAGE="http://xoscope.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="esd"

DEPEND=">=x11-libs/gtk+-2.0
	esd? ( media-sound/esound )"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/01-comedi.patch

	#gtk deprecated functions: GTK_WIDGET_STATE - GTK_WIDGET_VISIBLE
	epatch "${FILESDIR}"/02-deprecated_GTK.patch

	# do not strip
	sed -i 's/${STRIPPROG-strip}//' install-sh || die "sed failed"
}

src_compile() {
	econf $(use_with gtk)
	# build may fails with > -j1
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS COPYING ChangeLog NEWS README* TODO* \
|| die 	"dodoc failed"
}

