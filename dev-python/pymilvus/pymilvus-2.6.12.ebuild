# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python SDK for Milvus"
HOMEPAGE="
	https://pypi.org/project/pymilvus/
	https://github.com/milvus-io/pymilvus/
"
SRC_URI="https://github.com/milvus-io/pymilvus/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/grpcio-1.66.2[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.15[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.27.2[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.2.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
