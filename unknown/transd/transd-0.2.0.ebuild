# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The new X.org releases have brought real transparency support to
the X Window System. Unfortunately it is not really usable yet: only a
demonstration program named 'transset' is available.
transd fills this gap by providing a daemon which sets the transparency of
user-defined applications to user-defined values."

HOMEPAGE="http://transd.berlios.de/"

SRC_URI="http://download.berlios.de/transvader/${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~x86"

IUSE=""

DEPEND=">=x11-misc/xcompmgr-1.1 \
		>=x11-base/xorg-x11-6.0.8-r3"

src_compile() {
	econf || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	einstall || die
}

pkg_postinst () {

echo
ewarn
ewarn 'In order to use transd, you need to enable the "Composite Extension"'
ewarn 'in your xorg.conf. Add this section if not present at the bottom:'
ewarn
ewarn 'Section "Extensions" '
ewarn 'Option "Composite" "Enable"'
ewarn 'Option "RenderAccel" "true"'
ewarn 'EndSection'
ewarn
ewarn 'RenderAccel is useful since it can speed up rendering, but it is not'
ewarn 'absolutely neccessary. Good luck!'
ewarn
ewarn 'Also, add the following lines to your ~/.xinitrc :'
ewarn 'xcompmgr -c -F &'
ewarn 'transd &'
ewarn
echo
}
