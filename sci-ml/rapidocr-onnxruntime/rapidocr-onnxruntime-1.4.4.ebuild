# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A cross platform OCR Library based on OnnxRuntime"
HOMEPAGE="
	https://pypi.org/project/rapidocr-onnxruntime/
"
SRC_URI="https://files.pythonhosted.org/packages/ba/12/1e5497183bdbe782dbb91bad1d0d2297dba4d2831b2652657f7517bfc6df/rapidocr_onnxruntime-${PV}-py3-none-any.whl"

LICENSE="Apaache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/rapidocr[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}

