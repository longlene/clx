# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit zproduct

MY_PN="DIYPloneStyle"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Base to develop new styles for Plone 2.1.x."
HOMEPAGE="http://plone.org/products/dyiplonestyle"
SRC_URI="http://plone.org/products/dyiplonestyle/releases/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=">=net-zope/plone-2.1"
RDEPEND="${DEPEND}"

ZPROD_LIST="${MY_PN}"

pkg_postinst() {
	elog
	elog "Use \"zprod-manager add\" to activate ${MY_PN}."
	elog
}
