# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A bleeding-edge, lock-free, wait-free, continuation-stealing tasking library"
HOMEPAGE="https://github.com/ConorWilliams/libfork"
SRC_URI="https://github.com/ConorWilliams/libfork/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
