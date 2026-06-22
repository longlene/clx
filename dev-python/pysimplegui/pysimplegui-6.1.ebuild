# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python GUIs for Humans, wrapping tkinter, Qt, WxPython and Remi"
HOMEPAGE="https://www.PySimpleGUI.com https://github.com/PySimpleGUI/PySimpleGUI"
SRC_URI="https://github.com/PySimpleGUI/PySimpleGUI/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/PySimpleGUI-${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
