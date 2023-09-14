# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Soundcard Oscilloscope for X"
HOMEPAGE="http://xoscope.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="esd gtk"

DEPEND="gtk? ( >=x11-libs/gtk+-1.2.0 )
	esd? ( media-sound/esound )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/01-xoscope_pointer_fix.patch"

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
	dodoc AUTHORS ChangeLog HARDWARE INTERNALS NEWS README* TODO *.ps \
	|| die 	"dodoc failed"
}
