# Distributed under the terms of the GNU General Public License v2

EAPI=6

#PYTHON_COMPAT=( python2_7 python3_4 python3_5 )
PYTHON_COMPAT=( python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="http://pytorch.org"
#SRC_URI="https://github.com/pytorch/pytorch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/pytorch/pytorch.git"
EGIT_COMMIT="v${PV}"
EGIT_CLONE_TYPE="shallow"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	dev-python/pyyaml
	cuda? ( dev-util/nvidia-cuda-toolkit dev-libs/nvidia-cuda-cudnn )
"
RDEPEND="${DEPEND}"


DOCS="README.md"

src_prepare() {
	eapply_user
	if use cuda ; then
		export CUDA_HOME=/opt/cuda
	else
		export NO_CUDA=1
	fi
}

