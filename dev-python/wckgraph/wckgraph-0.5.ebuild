# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python

DESCRIPTION="The WCK Graph package is a simple plotting package for the Widget Construction Kit. The current version supports various 2D plots such as line plots, scatter plots, area plots and bar diagrams."
HOMEPAGE="http://effbot.org/zone/wckgraph.htm"
SRC_URI="http://effbot.org/downloads/wckgraph-0.5-20040421.zip"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
LICENSE="as-is"
IUSE=""

DEPEND="dev-python/wck"
S="${WORKDIR}/wckgraph-0.5-20040421"

pkg_setup() {
	# check for Tkinter support in python
	distutils_python_tkinter
}

src_unpack() {
    # custom unpack is neede because the default one produces worning
    # "warning:  ... appears to use backslashes as path separators"
    # and exits ebuild process
	unzip -qq ${DISTDIR}/${A} || continue
}