# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Read Google Cloud Storage, Azure Blobs, and local paths with the same interface"
HOMEPAGE="https://github.com/blobfile/blobfile"
SRC_URI="https://github.com/blobfile/blobfile/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pycryptodome-3.8[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.0[${PYTHON_USEDEP}]
"
BDEPEND=""

#distutils_enable_tests pytest
RESTRICT="test"
