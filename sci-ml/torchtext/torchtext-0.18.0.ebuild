# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Models, data loaders and abstractions for language processing"
HOMEPAGE="https://pytorch.org/text"
SRC_URI="
	https://github.com/pytorch/text/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/double-conversion/archive/b1d531bfb130e7149ffe24bb0f1c5c01f20c3a5f.tar.gz -> double-conversion-b1d531bfb130e7149ffe24bb0f1c5c01f20c3a5f.tar.gz
	https://github.com/google/re2/archive/2b25567a8ee3b6e97c3cd05d616f296756c52759.tar.gz -> re2-2b25567a8ee3b6e97c3cd05d616f296756c52759.tar.gz
	https://github.com/google/sentencepiece/archive/0e6dfbf86e2fa6d86a3d9a8a08a628da71c073e0.tar.gz -> sentencepiece-0e6dfbf86e2fa6d86a3d9a8a08a628da71c073e0.tar.gz
	https://github.com/JuliaStrings/utf8proc/archive/0890a538bf8238cded9be0c81171f57e43f2c755.tar.gz -> utf8proc-0890a538bf8238cded9be0c81171f57e43f2c755.tar.gz
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}"/text-${PV}

src_prepare() {
	default
	sed -e '/^_init_submodule/d' \
		-i setup.py
	rmdir third_party/double-conversion && ln -sv "${WORKDIR}"/double-conversion-b1d531bfb130e7149ffe24bb0f1c5c01f20c3a5f third_party/double-conversion
	rmdir third_party/re2 && ln -sv "${WORKDIR}"/re2-2b25567a8ee3b6e97c3cd05d616f296756c52759 third_party/re2
	rmdir third_party/sentencepiece && ln -sv "${WORKDIR}"/sentencepiece-0e6dfbf86e2fa6d86a3d9a8a08a628da71c073e0 third_party/sentencepiece
	rmdir third_party/utf8proc && ln -sv "${WORKDIR}"/utf8proc-0890a538bf8238cded9be0c81171f57e43f2c755 third_party/utf8proc
	distutils-r1_src_prepare
}
