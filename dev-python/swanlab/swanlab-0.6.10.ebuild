# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python library for streamlined tracking and management of AI training processes"
HOMEPAGE="
	https://pypi.org/project/swanlab/
	https://github.com/SwanHubX/SwanLab
"
SRC_URI="https://github.com/SwanHubX/SwanLab/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/swankit-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.0.0[${PYTHON_USEDEP}]
	dev-python/pynvml[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.35.49[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pyecharts-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.17.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.6.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/SwanLab-${PV}
