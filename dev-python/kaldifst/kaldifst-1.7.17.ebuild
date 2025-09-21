# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for OpenFST and its extensions from Kaldi"
HOMEPAGE="
	https://pypi.org/project/kaldifst/
	https://github.com/k2-fsa/kaldifst
"
SRC_URI="
	https://github.com/k2-fsa/kaldifst/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/csukuangfj/openfst/archive/refs/tags/sherpa-onnx-2024-06-13.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

export OPENFST_SOURCE_DIR="${WORKDIR}"/openfst-sherpa-onnx-2024-06-13/

