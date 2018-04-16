# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Tool to check C++ #include dependencies"
HOMEPAGE="https://github.com/tomtom-international/cpp-dependencies"
SRC_URI="https://github.com/tomtom-international/cpp-dependencies/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
