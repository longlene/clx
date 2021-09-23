# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library"
HOMEPAGE="https://xgboost.ai/"
SRC_URI="
	https://github.com/dmlc/xgboost/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/dmlc/dmlc-core/archive/refs/tags/v0.5.tar.gz -> dmlc-core-0.5.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir dmlc-core && mv "${WORKDIR}"/dmlc-core-0.5 dmlc-core
	cmake-utils_src_prepare
}
