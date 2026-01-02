# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="NVIDIA Federated Learning Application Runtime Environment"
HOMEPAGE="https://github.com/NVIDIA/NVFlare"
SRC_URI="https://github.com/NVIDIA/NVFlare/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/cryptography-36.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/flask-jwt-extended-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/flask-sqlalchemy-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.62.1[${PYTHON_USEDEP}]
	>=www-servers/gunicorn-22.0.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.24.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/docker-6.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pyhocon[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	sci-ml/safetensors[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/NVFlare-${PV}
