# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="ONNX GraphSurgeon"
HOMEPAGE="
	https://pypi.org/project/onnx-graphsurgeon/
	https://github.com/NVIDIA/TensorRT/tree/main/tools/onnx-graphsurgeon
"
SRC_URI="$(pypi_wheel_url ${PN} ${PV} 'py2.py3')"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-python/ml-dtypes[${PYTHON_USEDEP}]
    dev-python/numpy[${PYTHON_USEDEP}]
    sci-ml/onnx>=1.14.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_unpack() {
	:
}

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}
