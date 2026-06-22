# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13,14} )

inherit distutils-r1

DESCRIPTION="Megatron's multi-modal data loader"
HOMEPAGE="https://github.com/NVIDIA/Megatron-Energon"
SRC_URI="https://github.com/NVIDIA/Megatron-Energon/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Megatron-Energon-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="transforms"
RESTRICT="test"

# Missing deps not yet in ::gentoo or overlay:
#   dev-python/braceexpand
#   dev-python/mfusepy
#   dev-python/multi-storage-client
#   dev-python/rapidyaml (python bindings for ryml)
#   dev-python/webdataset
RDEPEND="
	sci-ml/pytorch
	$(python_gen_cond_dep '
		dev-python/click[${PYTHON_USEDEP}]
		>=dev-python/filetype-1.0.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.1[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/s3fs[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
	transforms? ( sci-ml/torchvision )
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-vcs[${PYTHON_USEDEP}]
	')
"

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION="${PV}" distutils-r1_python_compile
}
