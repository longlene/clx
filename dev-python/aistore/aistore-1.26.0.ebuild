# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python SDK for AIStore, scalable storage for AI applications"
HOMEPAGE="
	https://pypi.org/project/aistore/
	https://aistore.nvidia.com
	https://github.com/NVIDIA/aistore
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.28.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.18[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
	>=dev-python/overrides-7.4.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/humanize-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/braceexpand-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/msgspec-0.18.5[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
"
