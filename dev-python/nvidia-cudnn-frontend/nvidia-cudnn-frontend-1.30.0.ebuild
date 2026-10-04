# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 multibuild

DESCRIPTION="cuDNN Frontend: Python bindings for the cuDNN C++ frontend API"
HOMEPAGE="
	https://github.com/NVIDIA/cudnn-frontend
	https://pypi.org/project/nvidia-cudnn-frontend/
"
# The Python package (nvidia-cudnn-frontend) ships as per-CPython prebuilt
# manylinux wheels bundling the compiled cudnn-frontend library; the tree's
# sci-ml/cudnn-frontend builds the C++ library only (bindings disabled).
# Package the official PyPI wheels for the supported targets.
SRC_URI="
	https://files.pythonhosted.org/packages/5e/57/bcaddbc3297eebec989f79d84853c79f39b74b503b9e57253a61ad9192e1/nvidia_cudnn_frontend-${PV}-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
	https://files.pythonhosted.org/packages/ee/11/d76d9954cc6c1ee0c8fbec0ebfe3232f1653ad9a23ff019fc3c9a4d00b91/nvidia_cudnn_frontend-${PV}-cp314-cp314-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
"
S="${WORKDIR}"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/nvidia-cutlass-dsl-4.6.2[${PYTHON_USEDEP}]
	>=sci-ml/tvm-ffi-0.1.11[${PYTHON_USEDEP}]
"

RESTRICT="test"

python_compile() {
	local cp
	case "${MULTIBUILD_VARIANT}" in
		python3_13) cp="cp313" ;;
		python3_14) cp="cp314" ;;
		*) die "no nvidia-cudnn-frontend wheel for ${MULTIBUILD_VARIANT}" ;;
	esac
	local WHL="nvidia_cudnn_frontend-${PV}-${cp}-${cp}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${WHL}"
}
