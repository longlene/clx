# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Rebootless Linux kernel security updates"
HOMEPAGE="http://web.mit.edu/ksplice/"
SRC_URI="http://web.mit.edu/ksplice/dist/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
