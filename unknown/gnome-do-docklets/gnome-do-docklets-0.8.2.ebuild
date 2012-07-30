# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils gnome2 mono

MY_PN="do-plugins"

DESCRIPTION="Plugins to put the Do in Gnome Do"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/${MY_PN}/0.8/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=gnome-extra/gnome-do-${PV}"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf --enable-debug=no --enable-release=yes || die "configure failed"
}

src_compile()
{
	# The make system is unfortunately broken for parallel builds and
	# upstream indicated on IRC that they have no intention to fix
	# that.
	emake -j1 || die "make failed"
}
