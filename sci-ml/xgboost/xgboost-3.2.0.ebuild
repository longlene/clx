# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

GPUTREESHAP_COMMIT="40eae8c4c45974705f8053e4d3d05b88e3cfaefd"

DESCRIPTION="Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library"
HOMEPAGE="https://xgboost.ai/"
SRC_URI="
	https://github.com/dmlc/xgboost/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/rapidsai/gputreeshap/archive/${GPUTREESHAP_COMMIT}.tar.gz -> gputreeshap-${GPUTREESHAP_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda nccl python"

DEPEND="
	dev-libs/dmlc-core
	cuda? (
		dev-util/nvidia-cuda-toolkit
		nccl? (
			dev-libs/nccl
		)
	)
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/system-dmlc-core.patch
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
	rmdir gputreeshap && ln -sv "${WORKDIR}"/gputreeshap-${GPUTREESHAP_COMMIT} gputreeshap
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
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
