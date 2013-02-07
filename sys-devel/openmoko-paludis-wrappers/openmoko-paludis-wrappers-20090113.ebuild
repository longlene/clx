# Copyright 2008-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $

inherit toolchain-funcs eutils

DESCRIPTION="paludis wrappers for openmoko"
HOMEPAGE="http://embedded.gentoo.org/"
SRC_URI="http://patches.piasek.co.uk/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/paludis"

S="${WORKDIR}/${PN}"

src_compile() {
	emake PREFIX=/usr || die
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install || die
}

pkg_postinst() {
        [[ ! -d /var/paludis/repositories/openmoko-host ]] && paludis -s x-openmoko-host
	[[ ! -f /usr/share/crossdev/include/site/arm-linux-gnueabi ]] && ln -sf /var/paludis/repositories/openmoko-host/arm-linux-gnueabi /usr/share/crossdev/include/site/arm-linux-gnueabi
	paludis-wrapper --init
}
