# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A file utility for accessing both local and remote files through a unified interface"
HOMEPAGE="
	https://pypi.org/project/cached-path/
"
SRC_URI="https://github.com/allenai/cached_path/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/rich-12.1[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.4[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-1.32.0[${PYTHON_USEDEP}]
	>=sci-libs/huggingface_hub-0.8.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/cached_path-${PV}
