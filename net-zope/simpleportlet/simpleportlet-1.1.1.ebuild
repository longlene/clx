# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit zproduct

MY_PN="SimplePortlet"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Product that lets the user to create portlets in Plone like any
other content type"
HOMEPAGE="http://plone.org/products/simpleportlet"
SRC_URI="http://plone.org/products/simpleportlet/releases/${PV}/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=">=net-zope/plone-2.1"
RDEPEND="${DEPEND}"
ZPROD_LIST="${MY_PN}"
