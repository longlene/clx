# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

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
IUSE="cuda nccl"

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
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/system-dmlc-core.patch
)

src_prepare() {
	rmdir gputreeshap && ln -sv "${WORKDIR}"/gputreeshap-${GPUTREESHAP_COMMIT} gputreeshap
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CUDA=$(usex cuda)
		-DUSE_NCCL=$(usex nccl)
	)
	cmake_src_configure
}
