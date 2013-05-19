# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyprotocols/pyprotocols-1.0_pre2306.ebuild,v 1.5 2007/12/31 16:30:53 josejx Exp $

NEED_PYTHON=2.4

inherit distutils

MY_P="PyPerforce-${PV}"
DESCRIPTION="PyPerforce is a Python extension that allows you to access the
Perforce  software configuration management system efficiently from Python code."
HOMEPAGE="http://pyperforce.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
LICENSE="|| ( PSF-2.4 ZPL )"
SLOT="0"
IUSE=""

DEPEND="${RDEPEND}
        >=dev-python/setuptools-0.6_rc5"


PYTHON_MODNAME="perforce"

src_compile() {
        cd ${MY_P}
        "${python}" setup.py bdist_egg
}

src_install() {
        cd ${MY_P}
        "${python}" setup.py install --root=${D} --no-compile "$@" || die
}

src_test() {
        PYTHONPATH="./src/" "${python}" setup.py test || die "tests failed"
}
