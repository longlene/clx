# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Small header only C++ library for writing multiplatform terminal applications"
HOMEPAGE="https://github.com/jupyter-xeus/cpp-terminal"
SRC_URI="https://github.com/jupyter-xeus/cpp-terminal/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
