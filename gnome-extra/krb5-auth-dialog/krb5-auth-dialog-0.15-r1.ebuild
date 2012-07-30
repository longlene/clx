# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils gnome2

DESCRIPTION="Kerberos 5 authentication dialog"
HOMEPAGE="https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/krb5-auth-dialog/${PV}/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+caps networkmanager"

DEPEND="virtual/krb5
	gnome-base/libgnomeui
	caps? ( sys-libs/libcap )
	networkmanager? ( net-misc/networkmanager )"
RDEPEND="${DEPEND}"

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_with caps libcap)
		$(use_enable networkmanager network-manager)"
}
