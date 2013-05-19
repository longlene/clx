# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python

DESCRIPTION="This library consists of several Pmw-based Tkinter widgets including a ProgressMeter, basic TreeNavigator and a GUI application framework for creating simple GUI apps quickly."
HOMEPAGE="http://pmwcontribd.sourceforge.net/"
SRC_URI="mirror://sourceforge/pmwcontribd/PmwContribD_r2_0_2.tar.gz"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
LICENSE="BSD"
IUSE=""

DEPEND=">=dev-lang/python-2.1
		  dev-python/pmw"
S="${WORKDIR}/PmwContribD-r2_0_2"

pkg_setup() {
	# check for Tkinter support in python
	distutils_python_tkinter
}