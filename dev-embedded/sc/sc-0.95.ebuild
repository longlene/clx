# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="serialconsole (sc) is a minimal terminal program allowing to use one machine"
HOMEPAGE="http://sourceforge.net/projects/serialconsole/"
SRC_URI="mirror://sourceforge/serialconsole/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_install() {
	dobin sc
	doman sc.1
	dodoc README
}
