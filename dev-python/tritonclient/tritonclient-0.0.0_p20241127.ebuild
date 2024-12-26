# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="76e15f2e5eda03546202f98f80576d070a2a8cf4"

DESCRIPTION="Python client library and utilities for communicating with Triton Inference Server"
HOMEPAGE="
	https://github.com/triton-inference-server/client
	https://pypi.org/project/tritonclient/
"
SRC_URI="https://github.com/triton-inference-server/client/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-${EGIT_COMMIT}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.19.1[${PYTHON_USEDEP}]
	>=dev-python/python-rapidjson-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.0.7[${PYTHON_USEDEP}]
"

RESTRICT="test"

S="${WORKDIR}"/client-${EGIT_COMMIT}/src/python/library

export VERSION="$(ver_cut 1)"

src_prepare() {
	default
	eapply "${FILESDIR}"/install-path.patch
	rm -rf tests
	distutils-r1_src_prepare
}
