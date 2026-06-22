# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Push Notifications that work with just about every platform"
HOMEPAGE="https://pypi.org/project/apprise/ https://github.com/caronc/apprise/"
SRC_URI="https://github.com/caronc/apprise/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dbus mqtt"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/certifi[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/markdown[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-oauthlib[${PYTHON_USEDEP}]
		dbus? ( dev-python/dbus-python[${PYTHON_USEDEP}] )
		mqtt? ( >=dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/babel[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=( pytest-mock )
EPYTEST_DESELECT=(
	tests/test_plugin_glib.py::test_plugin_glib_send_raises_generic
)

distutils_enable_tests pytest
