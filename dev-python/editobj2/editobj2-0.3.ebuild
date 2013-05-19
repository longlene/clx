# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"
PYTHON_USE_WITH_OPT="tk"
PYTHON_USE_WITH="tk"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="${P/editobj/EditObj}"

DESCRIPTION="EditObj2 can create a dialog box to edit ANY Python object."
SRC_URI="http://download.gna.org/songwrite/${MY_P}.tar.gz"
HOMEPAGE="http://home.gna.org/oomadness/en/editobj/index.html"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE="examples gtk tk qt4"

DEPEND="gtk? ( dev-python/pygtk )
	qt4? ( dev-python/PyQt4 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	use examples && (doins -r examples || die)
}
