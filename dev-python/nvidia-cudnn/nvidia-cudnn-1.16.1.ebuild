# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="cudnn-frontend"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="CUDNN FrontEnd python library"
HOMEPAGE="
	https://pypi.org/project/nvidia-cudnn/
	https://github.com/NVIDIA/cudnn-frontend/
"
SRC_URI="https://github.com/NVIDIA/cudnn-frontend/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="NVIDIA"
SLOT="0"
S="${WORKDIR}"/${MY_P}
KEYWORDS="~amd64"

DEPEND+="
	sci-libs/dlpack
"

BDEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/system-dlpack.patch
)

export CUDNN_FRONTEND_USE_SYSTEM_DLPACK="ON"
