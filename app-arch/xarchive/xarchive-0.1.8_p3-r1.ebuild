# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="${P/_p/-}"
DESCRIPTION="A GNU/Linux gtk2.0 front-end for various command line archiving tools."
HOMEPAGE="http://xarchive.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ace rar"

DEPEND=">=x11-libs/gtk+-2.0
	ace? ( app-arch/unace )
	rar? ( app-arch/rar )"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd ${S}

	## remove wrappers if needed:
	use ace || rm wrappers/ace-wrap.sh
	use rar || rm wrappers/rar-wrap.sh
}

src_install() {
	make DESTDIR=${D} install || die "install failed"

	#insinto /usr/share/applications ; doins	${FILESDIR}/xarchive.desktop

	dodoc AUTHORS ChangeLog NEWS README
}
