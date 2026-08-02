# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..15} )

inherit cmake distutils-r1

DESCRIPTION="Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library"
HOMEPAGE="https://xgboost.ai/"
SRC_URI="https://github.com/dmlc/xgboost/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda nccl python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	sci-libs/dmlc-core
	cuda? (
		dev-util/nvidia-cuda-toolkit
		nccl? (
			dev-libs/nccl
		)
	)
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
"
BDEPEND="python? ( ${DISTUTILS_DEPS} )"

PATCHES=(
	"${FILESDIR}"/cuda13-lambda-default-constructor.patch
)

wrap_python() {
	if use python; then
		pushd python-package > /dev/null || die
		local phase=$1
		distutils-r1_${phase} "$@"
		popd > /dev/null || die
	fi
}

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_WITH_SYSTEM_DMLC=ON
		-DUSE_CUDA=$(usex cuda)
		-DUSE_NCCL=$(usex nccl)
	)
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}
