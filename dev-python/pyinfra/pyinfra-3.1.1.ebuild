# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="pyinfra automates infrastructure super fast at massive scale"
HOMEPAGE="https://pyinfra.com/"
SRC_URI="https://github.com/pyinfra-dev/pyinfra/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/gevent-1.5[${PYTHON_USEDEP}]
	>=dev-python/paramiko-2.7[${PYTHON_USEDEP}]
	>=dev-python/click-2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/configparser[${PYTHON_USEDEP}]
	dev-python/pywinrm[${PYTHON_USEDEP}]
	dev-python/typeguard[${PYTHON_USEDEP}]
	>=dev-python/distro-1.6[${PYTHON_USEDEP}]
	>=dev-python/packaging-16.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
