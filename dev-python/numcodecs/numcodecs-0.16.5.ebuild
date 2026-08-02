# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Buffer compression and transformation codecs for data storage"
HOMEPAGE="https://github.com/zarr-developers/numcodecs"

LICENSE="MIT BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="crc32c google-crc32c msgpack"
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	crc32c? ( dev-python/crc32c[${PYTHON_USEDEP}] )
	google-crc32c? ( dev-python/google-crc32c[${PYTHON_USEDEP}] )
	msgpack? ( dev-python/msgpack[${PYTHON_USEDEP}] )
"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"
