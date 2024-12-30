# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Intel Instrumentation and Tracing Technology (ITT) and Just-In-Time (JIT) API"
HOMEPAGE="https://github.com/intel/ittapi/"
SRC_URI="https://github.com/intel/ittapi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 BSD-3 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

