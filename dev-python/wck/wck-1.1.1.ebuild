# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python

DESCRIPTION="The Widget Construction Kit (WCK) is an extension API that allows you to implement all sorts of custom widgets, in pure Python. The Tkinter 3000 implementation of the WCK is designed to work with the existing Tkinter layer, as well as the upcoming Tkinter 3000 interface layer."
HOMEPAGE="http://effbot.org/zone/wck.htm"
SRC_URI="http://effbot.org/downloads/tkinter3000-1.1.1-20061204.zip"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
LICENSE="as-is"
IUSE=""

DEPEND=">=dev-lang/python-2.1"
S="${WORKDIR}/tkinter3000-1.1.1-20061204"

pkg_setup() {
	# check for Tkinter support in python
	distutils_python_tkinter
}