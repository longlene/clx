# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ argument parsing library"
HOMEPAGE="https://github.com/mmahnic/argumentum"
SRC_URI="https://github.com/mmahnic/argumentum/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
