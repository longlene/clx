# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Simple paint program inspired by MS Paint"
HOMEPAGE="https://code.google.com/p/gnome-paint/"
SRC_URI="https://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.16:2"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35"

src_install() {
	emake DESTDIR="${D}" install || die

	# Resolve non-FHS /usr/doc/
	dodir /usr/share/doc/ || die
	mv "${D}"/usr/{,share/}doc/gnome-paint || die
	rmdir "${D}"/usr/doc/ || die

	# Remove .xpms installed to /usr/include/
	rm -R "${D}"/usr/include/ || die
}
