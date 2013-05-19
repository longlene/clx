# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DOCS="README.txt Changelog"

inherit distutils

DESCRIPTION="Python library which provides a wide range of capabilities"
HOMEPAGE="http://www.ikaaro.org/itools"
SRC_URI="http://download.ikaaro.org/itools/${P}.tar.gz"

DEPEND=">=dev-lang/python-2.4"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~ppc ~x86"

