# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# setuptools_scm cannot detect version from a tarball
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

DESCRIPTION="Build GUI for your Python program with JavaScript, HTML, and CSS"
HOMEPAGE="https://pywebview.flowrl.com/ https://github.com/r0x0r/pywebview"
SRC_URI="https://github.com/r0x0r/pywebview/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+gtk qt6 ssl"
REQUIRED_USE="|| ( gtk qt6 )"
RESTRICT="test"

RDEPEND="
	dev-python/bottle[${PYTHON_USEDEP}]
	dev-python/proxy_tools[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	gtk? (
		dev-python/pygobject[cairo,${PYTHON_USEDEP}]
		net-libs/webkit-gtk
	)
	qt6? (
		dev-python/pyqt6[${PYTHON_USEDEP}]
		dev-python/pyqt6-webengine[${PYTHON_USEDEP}]
		dev-python/qtpy[${PYTHON_USEDEP}]
	)
	ssl? ( dev-python/cryptography[${PYTHON_USEDEP}] )
"
BDEPEND="$(python_gen_cond_dep '
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
')"

distutils_enable_tests pytest
