# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="retinaface_py"

DESCRIPTION="RetinaFace: Single-stage Dense Face Localisation in the Wild"
HOMEPAGE="
	https://pypi.org/project/retinaface-py/
	https://github.com/andresprados/Pytorch_Retinaface
"

# No sdist and no matching upstream release tag exists for this PyPI
# release; installing the published wheel directly (pure Python, no
# compiled extension).
SRC_URI="https://files.pythonhosted.org/packages/4c/de/f90cc5c235b8ccc8d893b0616a5d7ec59c59fe19339fa3b7fa7867b9f1ff/${MY_PN}-${PV}-py3-none-any.whl"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.3.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.0[python,${PYTHON_USEDEP}]
	')
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${MY_PN}-${PV}-py3-none-any.whl"
}
