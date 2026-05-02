# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Model components for PyMilvus"
HOMEPAGE="
	https://github.com/milvus-io/milvus-model
"
SRC_URI="https://github.com/milvus-io/milvus-model/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/onnxruntime[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/milvus-model-${PV}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYMILVUS_MODEL="${PV}"
