# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit zproduct

DESCRIPTION="Make Plone websites parseable by Google sitemaps."
HOMEPAGE="http://quintagroup.com/services/plone-development/products/google-sitemaps"
SRC_URI="mirror://sourceforge/quintagroup/qPloneGoogleSitemaps-${PV}.tar.gz"
LICENSE="ZPL"
KEYWORDS="~x86"
IUSE=""
RDEPEND=">=net-zope/plone-2.0.3"
ZPROD_LIST="qPloneGoogleSitemaps"