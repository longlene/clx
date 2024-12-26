# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python client for OpenVINO Model Server"
HOMEPAGE="
	https://github.com/openvinotoolkit/model_server
	https://pypi.org/project/ovmsclient/
"
SRC_URI="https://github.com/openvinotoolkit/model_server/archive/refs/tags/v${PV}.tar.gz -> openvino-model-server-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/grpcio-1.47.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27.1[${PYTHON_USEDEP}]
"

RESTRICT="test"

S="${WORKDIR}"/model_server-${PV}/client/python/ovmsclient/lib
