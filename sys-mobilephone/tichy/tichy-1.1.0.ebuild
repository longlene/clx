# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A python applets manager that can be used to create simple user interface for devices with small screen."
HOMEPAGE="http://code.google.com/p/tichy/"
SRC_URI="http://tichy.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND=">=dev-python/pygame-1.8.0
	dev-python/python-xlib"
DEPEND="${RDEPEND}"

src_install() {
	distutils_src_install
}
