# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_2 )
LANGS="ca cs da de es et eu fr it ja pl pt ru sk zh_CN zh_TW"

inherit eutils qt4-r2 distutils-r1
MY_PN="ReText"
MY_P="${MY_PN}-${PV/_/~}"
DESCRIPTION="A Qt-based text editor for Markdown and reStructuredText"
HOMEPAGE="http://sourceforge.net/p/retext/home/ReText/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+spell"

RDEPEND="dev-python/PyQt4[webkit]
	dev-python/markups
	dev-python/markdown
	dev-python/docutils
	spell? ( dev-python/pyenchant )"

S="${WORKDIR}/${MY_P}"

src_install(){
	distutils-r1_src_install
	newicon {icons/,}${PN}.png
	newicon {icons/,}${PN}.svg
	for L in ${LINGUAS}; do
		for Z in ${LANGS}; do
			if [[ ${L} == ${Z} ]]; then
				insinto /usr/share/${PN}
				doins locale/${PN}_${L}.{qm,ts}
			fi
		done
	done
	dodir /usr/share/wpgen
	insinto /usr/share/wpgen
	doins -r templates
	make_desktop_entry "retext" "ReText Editor" "retext" "Development;Utility;TextEditor"
}
