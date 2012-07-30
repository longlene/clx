inherit eutils

DESCRIPTION="Listens to key press/release events from a keyboard or a mouse and allows sending fake key events to an X display."
HOMEPAGE="http://home.orange.nl/aromanov/crolix/${PN}/"
SRC_URI="http://home.orange.nl/aromanov/crolix/${PN}/downloads/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND="x11-libs/libX11 x11-libs/libXtst"
RDEPEND="${DEPEND}"

src_compile() {
	econf --without-input-group || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_preinst() {
	enewgroup input
	fowners :input /usr/bin/key-scripter || die "fowners :input key-scripter failed"
	fperms g+s /usr/bin/key-scripter || die "fperms g+s key-scripter failed"
}

pkg_postinst() {
	elog "Don't forget to change the group of the source input device file to"
	elog "the 'input' group in order for Key Scripter to be able to read from it."
	elog "You can do that by making sure that the following line is automatically"
	elog "executed during system start-up, for example by adding it to the"
	elog "/etc/conf.d/local.start file:"
	elog ""
	elog "  chown :input /dev/input/event* && chmod g+r /dev/input/event*"
	elog ""
}
