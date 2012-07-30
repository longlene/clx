# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mono

DESCRIPTION="Linux client for reading and posting to twitter.com web service."
HOMEPAGE="http://code.google.com/p/gtwitter/"
SRC_URI="http://gtwitter.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=x11-libs/cairo-1.6.4-r1[X]
	>=dev-dotnet/gnome-sharp-2
	>=x11-libs/libsexy-0.1.11"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README || die
}

