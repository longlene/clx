# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Proxy finder program previously known as proxy hunter customed"
HOMEPAGE="http://www.gnu.org/software/proxyknife"
SRC_URI="http://ftp.gnu.org/gnu/proxyknife/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-devel/gettext
		dev-lang/perl"
RDEPEND="${DEPEND}"

src_install() {
		einstall || die "einstall failed"
}
