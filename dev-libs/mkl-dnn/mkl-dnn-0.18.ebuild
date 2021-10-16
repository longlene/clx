# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Intel(R) Math Kernel Library for Deep Neural Networks (Intel(R) MKL-DNN)"
HOMEPAGE="https://01.org/mkl-dnn"
SRC_URI="https://github.com/01org/mkl-dnn/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

