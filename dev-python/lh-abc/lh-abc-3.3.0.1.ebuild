# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="LH-ABC (BitTorrent Client based on ABC)"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://lh-abc.googlecode.com/files/LH-ABC-src-${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/wxpython-2.8
  >=dev-python/bsddb3-4.8"	   

RDEPEND="${DEPEND}"
