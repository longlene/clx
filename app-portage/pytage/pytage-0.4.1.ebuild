# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="A commandline tool for managing portage's user config files"
HOMEPAGE="http://code.google.com/p/kenscodepit/wiki/pytage"
SRC_URI="http://kenscodepit.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc"
IUSE=""

RDEPEND="virtual/pager"

