# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils x-modular

RESTRICT="nomirror"

DESCRIPTION="Multihead capable X server for GGI, with acceleration"
HOMEPAGE="http://www.ggi-project.org/"
SRC_URI="mirror://sourceforge/ggi/${P}.src.tar.gz"

LICENSE="${LICENSE} MIT"
SLOT="0"
KEYWORDS="~ppc"
IUSE="minimal xprint"

# Many dependencies are, but these are simply modified.
# The dependencies comes from x11-base/xorg-server,
# and then, remove DRI/OpenGL stuffs, added LibGGI. :)
RDEPEND=">=media-libs/libggi-2.2.1-r1
	x11-libs/libXfont
	x11-libs/xtrans
	x11-libs/libXau
	x11-libs/libXext
	x11-libs/libX11
	x11-libs/libxkbfile
	x11-libs/libXdmcp
	x11-libs/libXmu
	x11-libs/libXrender
	x11-libs/libXi
	media-libs/freetype
	media-fonts/font-misc-misc
	media-fonts/font-cursor-misc
	x11-misc/xbitmaps
	|| ( x11-misc/xkeyboard-config x11-misc/xkbdata )
	x11-apps/iceauth
	x11-apps/rgb
	x11-apps/xauth
	x11-apps/xinit
	x11-libs/libXaw
	x11-libs/libXpm
	x11-libs/libXxf86misc
	x11-libs/libXxf86vm
	!minimal? ( x11-libs/libdmx
		x11-libs/libXtst
		x11-libs/libXres )
	x11-libs/libxkbui
	x11-libs/liblbxutil"
	# Xres is dmx-dependent, xkbui is xorgcfg-dependent
	# Xaw is dmx- and xorgcfg-dependent
	# Xpm is dmx- and xorgcfg-dependent, pulls in Xt
	# Xxf86misc and Xxf86vm are xorgcfg-dependent
	# liblbxutil is lbx- dependent
DEPEND="${RDEPEND}
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/fixesproto
	x11-proto/damageproto
	x11-proto/xextproto
	x11-proto/xproto
	x11-proto/xf86dgaproto
	x11-proto/xf86miscproto
	x11-proto/xf86rushproto
	x11-proto/xf86vidmodeproto
	x11-proto/xf86bigfontproto
	x11-proto/compositeproto
	x11-proto/recordproto
	x11-proto/resourceproto
	x11-proto/videoproto
	x11-proto/scrnsaverproto
	x11-proto/evieext
	x11-proto/trapproto
	>=x11-proto/xineramaproto-1.1-r1
	x11-proto/fontsproto
	>=x11-proto/kbproto-1.0-r1
	x11-proto/inputproto
	x11-proto/bigreqsproto
	x11-proto/xcmiscproto
	!minimal? ( x11-proto/dmxproto )
	xprint? ( x11-proto/printproto
		x11-apps/mkfontdir
		x11-apps/mkfontscale )"

X="${WORKDIR}/${P}/xserver/${PN}-server-${PV}"

src_unpack() {
	unpack ${A}

	cd "${S}"
	mv startx.sh startxggi.sh \
		|| die "startx.sh is missing. :("
	sed -i -e "s:startx\.sh:startxggi\.sh:g" README.quickguide \
		|| die "sed for README.quickguide failed. :("
	sed -i -e "s:startx\.sh:startxggi\.sh:g" README.help \
		|| die "sed for README.help failed. :("

	cd "${S}/xserver"
	tar -xjf "${PN}-server-${PV}.tar.bz2"

	cd "${X}"

	#epatch "${FILESDIR}/${P}_fix-blah.patch" # hopefully. :)
}

src_compile() {
	cd "${X}"

	econf \
		$(use_enable !minimal dmx) \
		$(use_enable !minimal xvfb) \
		$(use_enable !minimal xnest) \
		$(use_enable xprint) \
		--sysconfdir=/etc/X11 \
		--with-default-font-path=/usr/share/fonts/misc,/usr/share/fonts/75dpi,/usr/share/fonts/100dpi,/usr/share/fonts/TTF,/usr/share/fonts/Type1 \
		|| die "econf failed. :("

	emake || die "emake failed. :("
}

src_install () {
	cd "${X}"

	make DESTDIR="${D}" install || die "install failed. :("

	cd "${S}"
	mkdir -p "${D}/etc/X11/keymaps/"
	cp keymaps/xggimap.* "${D}/etc/X11/keymaps/" \
		|| die "xggimaps install failed. :("

	dobin startxggi.sh || die "startxggi.h install failed. :("

	dodoc README.{fonts,help,quickguide}

	# Remove to prevent overwriting X.Org stuff.
	ewarn ""
	ewarn "XGGI has little X.Org stuffs at the moment."
	ewarn "So, to prevent overwrite existing stuffs,"
	ewarn "this ebuild remove these duplicated X.Org stuffs are contained XGGI."
	ewarn ""
	rm "${D}/usr/share/aclocal/xorg-server.m4"
	rm "${D}/usr/lib/xserver/SecurityPolicy"
	rm "${D}/usr/lib/pkgconfig/xorg-server.pc"
	rm "${D}/usr/share/man/man1/Xserver.1x"
	rm "${D}/usr/bin/X"
}

pkg_postinst() {
	einfo ""
	einfo "Edit and use /usr/bin/startxggi.sh for the XGGI,"
	einfo "with GGI_DEFMODE, GGI_INPUT and GGI_DISPLAY."
	einfo "/usr/share/doc/${P}/README.help.gz can help you, as its name is. :)"
	einfo ""
}
