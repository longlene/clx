# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Ssh connection generation tool"
HOMEPAGE="http://www.ohmytux.com/belier/"
SRC_URI="http://www.ohmytux.com/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python dev-tcltk/expect"

PYTHON_MODNAME="belier"
