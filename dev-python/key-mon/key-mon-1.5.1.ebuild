# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Utility to show live keyboard and mouse status for teaching and screencasts"
HOMEPAGE="http://code.google.com/p/key-mon/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REPEND="dev-python/python-xlib
		dev-python/pygtk:2"
DEPEND="${RDEPEND}"

