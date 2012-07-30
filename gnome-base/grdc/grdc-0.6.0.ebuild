# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="GTK+/Gnome Remote Desktop Client"
HOMEPAGE="http://grdc.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
		mirror://sourceforge/${PN}/${PN}-gnome-${PVR}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="vnc ssh avahi vte gcrypt gnome"

DEPEND=">=x11-libs/gtk+-2.12
		net-misc/rdesktop
		vnc? ( net-libs/libvncserver )
		ssh? ( net-libs/libssh )
		avahi? ( net-dns/avahi )
		vte? ( x11-libs/vte )
		gcrypt? ( dev-libs/libgcrypt )
		gnome? ( >=gnome-base/gnome-panel-2.20 )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable vnc) \
		$(use_enable ssh) \
		$(use_enable avahi) \
		$(use_enable vte) \
		$(use_enable gcrypt)

	if use gnome; then
		(cd ../${PN}-gnome-${PVR} && econf)
	fi
}

src_compile() {
	emake || die "Error: emake failed."
	if use gnome; then
		(cd ../${PN}-gnome-${PVR} && emake) || die "Error: gnome emake failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "Error: install failed"
	if use gnome; then
		(cd ../${PN}-gnome-${PVR} \
			&& emake DESTDIR="${D}" install) || die "Error: gnome install failed"
	fi
	dodoc AUTHORS NEWS README ChangeLog || die

	find "${D}" -name '*.la' -delete || die
}
