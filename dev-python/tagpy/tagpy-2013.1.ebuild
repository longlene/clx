# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/tagpy/tagpy-0.94.8-r1.ebuild,v 1.10 2012/12/26 11:48:00 polynomial-c Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Python Bindings for TagLib"
HOMEPAGE="http://mathema.tician.de//software/tagpy http://pypi.python.org/pypi/tagpy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="examples"

RDEPEND=">=dev-libs/boost-1.48[python]
	>=media-libs/taglib-1.4"
DEPEND="${RDEPEND}
	dev-python/setuptools"

python_prepare_all() {
	# bug #440740
	local PATCHES=( "${FILESDIR}"/${P}-taglib-1.8_compat.patch )

	# Disable broken check for Distribute.
	sed -e "s/if 'distribute' not in setuptools.__file__:/if False:/" -i aksetup_helper.py
}

python_configure() {
	"${PYTHON}" configure.py \
		--taglib-inc-dir="${EPREFIX}/usr/include/taglib" \
		--boost-python-libname="boost_python-${PYTHON_ABI}-mt"
}

python_install_all() {
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins test/*
	fi
}
