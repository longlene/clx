# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

PUGIXML_COMMIT="db78afc2b7d8f043b4bc6b185635d949ea2ed2a8"
PYBIND11_COMMIT="8a099e44b3d5f85b20f05828d919d2332a8de841"

DESCRIPTION="Python bindings for pugixml"
HOMEPAGE="https://github.com/miute/pugixml-python"
SRC_URI="
	https://github.com/miute/pugixml-python/archive/refs/tags/v${PV}.tar.gz -> pugixml-python-${PV}.tar.gz
	https://github.com/zeux/pugixml/archive/${PUGIXML_COMMIT}.tar.gz -> pugixml-${PUGIXML_COMMIT}.tar.gz
	https://github.com/pybind/pybind11/archive/${PYBIND11_COMMIT}.tar.gz -> pybind11-${PYBIND11_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

S="${WORKDIR}"/pugixml-python-${PV}

src_prepare() {
	default
	rmdir src/third_party/pugixml && mv "${WORKDIR}"/pugixml-${PUGIXML_COMMIT} src/third_party/pugixml
	rmdir src/third_party/pybind11 && mv "${WORKDIR}"/pybind11-${PYBIND11_COMMIT} src/third_party/pybind11
	distutils-r1_src_prepare
}
