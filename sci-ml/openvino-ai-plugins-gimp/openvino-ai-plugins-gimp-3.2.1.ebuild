# Distributed under the terms of the GNU General Public License v2

EAPI=8
#DISTUTILS_EXT=1

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OpenVINO AI Plugins for GIMP"
HOMEPAGE="https://github.com/intel/openvino-ai-plugins-gimp"
SRC_URI="https://github.com/intel/openvino-ai-plugins-gimp/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	sci-ml/openvino[python]
	>=sci-ml/timm-0.4.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.37.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/controlnet-aux-0.0.6[${PYTHON_SINGLE_USEDEP}]
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
	sci-ml/sentencepiece[${PYTHON_SINGLE_USEDEP}]
"

RESTRICT="test"

python_prepare_all() {
	# setup.py uses git describe to get the version; inject PV directly
	sed -i "s/plugin_version = get_plugin_version(this_dir)/plugin_version = '${PV}'/" setup.py || die
	distutils-r1_python_prepare_all
}
