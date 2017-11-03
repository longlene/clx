# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 )

inherit python-single-r1

DESCRIPTION="An open-source software library for Machine Intelligence"
HOMEPAGE="https://www.tensorflow.org/"
SRC_URI="https://github.com/tensorflow/tensorflow/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda"

DEPEND="
	dev-util/bazel
	cuda? ( dev-util/nvidia-cuda-toolkit dev-libs/nvidia-cuda-cudnn )
"
RDEPEND="${DEPEND}"

src_configure() {
	export PYTHON_BIN_PATH=/usr/bin/${EPYTHON}
	if use cuda ; then
		export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
		export TF_NEED_CUDA=1
		export TF_UNOFFICAL_SETTING=1
		export CUDA_TOOLKIT_PATH=/opt/cuda
		export CUDNN_INSTALL_PATH=/usr

		export TF_CUDA_VERSION=$(nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
		export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
		export TF_CUDA_COMPUTE_CAPABILITIES=3.5,5.2

	else
		export TF_NEED_CUDA=0
	fi

	export TF_NEED_GCP=0
	export TF_NEED_HDFS=0
	export TF_NEED_OPENCL=0
	export TF_ENABLE_XLA=1
	export TF_NEED_JEMALLOC=1
	export CC_OPT_FLAGS="-march=native"
	./configure || die
}

src_compile() {
	cat > bazelrc <<EOF
startup --batch
build --spawn_strategy=standalone --genrule_strategy=standalone
build --jobs $(makeopts_jobs)
EOF
	export BAZELRC="$PWD/bazelrc"

	local myflags
	use cuda && myflags+="--cofnig=cuda"
	bazel build -c opt ${myflags} tensorflow:libtensorflow.so || die
}

src_install() {
	dolib.so bazel-bin/${PN}/libtensorflow.so
	insinto /usr/include/${PN}
	doins ${PN}/c/c_api.h
	dodoc README.md
}

