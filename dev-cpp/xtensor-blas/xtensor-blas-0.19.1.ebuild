# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="BLAS extension to xtensor"
HOMEPAGE="https://github.com/QuantStack/xtensor-blas"
SRC_URI="https://github.com/QuantStack/xtensor-blas/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xtensor-0.23.0
	virtual/blas
	virtual/lapack
"
RDEPEND="${DEPEND}"
