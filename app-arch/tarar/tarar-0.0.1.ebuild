# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Unified tar and rar packaging management utility"
HOMEPAGE="http://tarar.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~hppa ia64 ppc ~ppc64 sparc x86"
IUSE=""

RDEPEND="dev-lang/ruby
         app-arch/rar
		 app-arch/tar"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
#	cd ${S}  
}

src_install() {
	dobin ${PN}
}
