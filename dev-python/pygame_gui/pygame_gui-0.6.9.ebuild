# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1 pypi

MY_PV=${PV//./}

DESCRIPTION="A GUI module for pygame Community Edition"
HOMEPAGE="https://github.com/MyreMylar/pygame_gui"
SRC_URI="https://github.com/MyreMylar/pygame_gui/archive/refs/tags/v_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pygame-ce-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/python-i18n-0.3.9[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/pygame_gui-v_${MY_PV}
