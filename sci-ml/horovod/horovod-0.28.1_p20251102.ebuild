# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="26fe8813a25bbef5b2dd98676916f7b350050fb0"

DESCRIPTION="Distributed training framework for TensorFlow, Keras, PyTorch, and Apache MXNet"
HOMEPAGE="
	https://pypi.org/project/horovod/
	https://github.com/horovod/horovod
	http://horovod.ai/
"
SRC_URI="https://github.com/horovod/horovod/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	python? (
		${PYTHON_DEPS}
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	python? ( ${DISTUTILS_DEPS} )
"

RESTRICT="test"

export HOROVOD_WITHOUT_TENSORFLOW=1
export HOROVOD_WITHOUT_PYTORCH=1
export HOROVOD_WITHOUT_MXNET=1
export HOROVOD_WITHOUT_GLOO=1
export HOROVOD_WITHOUT_MPI=1

pkg_setup() {
	use python && python_setup
}

src_compile() {
	use python && distutils-r1_src_compile
}

src_install() {
	use python && distutils-r1_src_install
}
