# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit distutils-r1

DESCRIPTION="A file utility for accessing both local and remote files through a unified"
HOMEPAGE="
	https://github.com/allenai/cached_path
	https://pypi.org/project/cached-path/
"
SRC_URI="https://files.pythonhosted.org/packages/9b/da/59aa2a3f5d92415d1c072a35c94c7ada2251679b3bca3cf69d420ea95ac4/cached_path-${PV}.tar.gz -> ${PN/-/_}-${PV}.tar.gz"

S="${WORKDIR}/cached_path-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/boto3-1.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.4[${PYTHON_USEDEP}]
		dev-python/google-cloud-storage[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/rich-12.1[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
