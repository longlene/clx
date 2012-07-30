# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE="doc"
DESCRIPTION="Wave Sculpting LADSPA audio plugins/effects"
HOMEPAGE="http://artemiolabs.com/software/wasp/"
SRC_URI="http://artemiolabs.com/software/wasp/${P}.tar.bz2
	doc? ( http://artemiolabs.com/software/wasp/${PN}-docs-${PV}.tar.bz2 )"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

DEPEND="media-libs/ladspa-sdk"

src_install() {
	dodoc  AUTHORS ChangeLog
	use doc && dohtml -r "${WORKDIR}/${PN}-docs-${PV}/"
	insinto /usr/lib/ladspa
	insopts -m0755
	doins  "${S}"/plugins/wasp-*.so
}
