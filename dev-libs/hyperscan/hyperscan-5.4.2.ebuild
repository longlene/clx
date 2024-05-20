# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="High-performance regular expression matching library"
HOMEPAGE="
	https://www.hyperscan.io/
	https://github.com/intel/hyperscan
"
SRC_URI="https://github.com/intel/hyperscan/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
