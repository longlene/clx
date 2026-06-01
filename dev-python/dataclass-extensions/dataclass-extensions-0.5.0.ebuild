# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit distutils-r1

DESCRIPTION="Additional functionality for Python dataclasses"
HOMEPAGE="
	https://github.com/epwalsh/dataclass-extensions
	https://pypi.org/project/dataclass-extensions/
"
SRC_URI="https://files.pythonhosted.org/packages/da/85/665c3d1c0a793fc8721e168218ed6cbedfaef4b81dae5daa696af3fda9c2/dataclass_extensions-${PV}.tar.gz -> ${PN/-/_}-${PV}.tar.gz"

S="${WORKDIR}/dataclass_extensions-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
