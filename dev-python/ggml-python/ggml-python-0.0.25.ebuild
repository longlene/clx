# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1 pypi

GGML_COMMIT="b306d6e996ec0ace77118fa5098822cdc7f9c88f"

DESCRIPTION="Python bindings for ggml"
HOMEPAGE="https://github.com/abetlen/ggml-python"
SRC_URI="
	https://github.com/abetlen/ggml-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ggerganov/ggml/archive/${GGML_COMMIT}.tar.gz -> ggml-${GGML_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.6.3[${PYTHON_USEDEP}]
"
BDEPEND=""

#distutils_enable_tests pytest

src_prepare() {
	default
	rmdir vendor/ggml && mv "${WORKDIR}"/ggml-${GGML_COMMIT} vendor/ggml
	distutils-r1_src_prepare
}
