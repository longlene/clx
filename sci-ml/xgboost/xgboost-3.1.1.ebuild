# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DMLC_CORE_COMMIT="13341857549852a9a86b1894b5ba84c6276ab381"
GPUTREESHAP_COMMIT="787259b412c18ab8d5f24bf2b8bd6a59ff8208f3"

DESCRIPTION="Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library"
HOMEPAGE="https://xgboost.ai/"
SRC_URI="
	https://github.com/dmlc/xgboost/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/dmlc/dmlc-core/archive/${DMLC_CORE_COMMIT}.tar.gz -> dmlc-core-${DMLC_CORE_COMMIT}.tar.gz
	https://github.com/rapidsai/gputreeshap/archive/${GPUTREESHAP_COMMIT}.tar.gz -> gputreeshap-${GPUTREESHAP_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="cuda nccl"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir dmlc-core && ln -sv "${WORKDIR}"/dmlc-core-${DMLC_CORE_COMMIT} dmlc-core
	rmdir gputreeshap && ln -sv "${WORKDIR}"/gputreeshap-${GPUTREESHAP_COMMIT} gputreeshap
	cmake_src_prepare
}

#src_configure() {
#	local mycmakeargs=(
#		-DUSE_CUDA=$(usex cuda)
#		-DUSE_NCCL=$(usex nccl)
#	)
#	cmake_src_configure
#}
