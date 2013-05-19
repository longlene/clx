# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="*"

inherit python

DESCRIPTION="A module for very simple, easy GUI programming in Python"
HOMEPAGE="http://easygui.sourceforge.net/"
SRC_URI="http://${PN}.sourceforge.net/download/version${PV}/${PN}_v${PV}.tar.gz"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="CCPL-Attribution-2.0"
IUSE=""

S=${WORKDIR}

src_install() {
	insinto "$(python_get_sitedir)"
	doins ${PN}.py || die 
	dohtml easygui.html python_and_check_logo.gif || die
}

