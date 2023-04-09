# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C Pseudo-Random-Number-Generator (PRNG) library"
HOMEPAGE="https://github.com/steinwurf/ranbo"
SRC_URI="https://github.com/steinwurf/ranbo/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
