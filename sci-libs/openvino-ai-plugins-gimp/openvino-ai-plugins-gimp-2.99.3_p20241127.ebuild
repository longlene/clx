# Distributed under the terms of the GNU General Public License v2

EAPI=8
#DISTUTILS_EXT=1

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

EGIT_COMMIT="e7395e31d703af884293df533a6a49cce39bdc43"

DESCRIPTION="OpenVINO AI Plugins for GIMP"
HOMEPAGE="https://github.com/intel/openvino-ai-plugins-gimp"
SRC_URI="https://github.com/intel/openvino-ai-plugins-gimp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/openvino[python]
	>=sci-libs/timm-0.4.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/transformers-4.37.0[${PYTHON_SINGLE_USEDEP}]
	sci-libs/diffusers[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/controlnet-aux-0.0.6[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		net-misc/gdown[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.8.1.78[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
