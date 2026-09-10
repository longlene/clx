# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Search Inference Engine (superlinked/sie) Python SDK"
HOMEPAGE="https://github.com/superlinked/sie"
SRC_URI="https://github.com/superlinked/sie/archive/refs/tags/v${PV}.tar.gz -> sie-${PV}.gh.tar.gz"
S="${WORKDIR}/sie-${PV}/packages/sie_sdk"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="storage"

RDEPEND="
	storage? ( sci-ml/huggingface_hub )
	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/msgpack-numpy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		storage? (
			dev-python/alibabacloud-credentials[${PYTHON_USEDEP}]
			dev-python/azure-identity[${PYTHON_USEDEP}]
			dev-python/azure-storage-blob[${PYTHON_USEDEP}]
			dev-python/boto3[${PYTHON_USEDEP}]
			dev-python/google-cloud-storage[${PYTHON_USEDEP}]
			dev-python/oss2[${PYTHON_USEDEP}]
		)
	')
"
