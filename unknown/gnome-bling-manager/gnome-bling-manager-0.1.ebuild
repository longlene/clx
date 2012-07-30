# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/gedit/gedit-2.10.3.ebuild,v 1.9 2005/08/24 01:29:15 vapier Exp $

inherit eutils 

DESCRIPTION="An interface to easily configure gnome desktop effects."
HOMEPAGE="https://wiki.ubuntu.com/GnomeBlingManager"
#SRC_URI="https://wiki.ubuntu.com/GnomeBlingManager?action=AttachFile&do=get&target=gnome-bling-manager-${PV}.tar.gz"
SRC_URI="https://wiki.ubuntu.com/gnome-bling-manager-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND=">=gnome-base/gnome
	 >=x11-misc/xcompmgr
	 >=x11-misc/transset"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_compile() {
        local myconf
#        myconf="${myconf} --disable-shared --disable-debug --with-wx=yes"
	econf ${myconf} || die "Could not configure FlameRobin"
	emake || die "error during make"
}
src_install() {
        make DESTDIR=${D} install || die "Could not install FlameRobin"

	insinto /usr/share/pixmaps
	newins ${S}/pixmaps/bling.xpm bling.xpm

	insinto /usr/share/applications
	doins ${S}/src/gnome-bling-manager.desktop

        dodoc devdocs docs docs-src
}

