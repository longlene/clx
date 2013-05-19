# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2 3"

inherit eutils distutils

DESCRIPTION="Python library to create SVG drawings."
HOMEPAGE="http://pypi.python.org/pypi/svgwrite"
SRC_URI="https://bitbucket.org/mozman/svgwrite/downloads/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
