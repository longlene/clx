# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast Base64 stream encoder/decoder in C99, with SIMD acceleration"
HOMEPAGE="https://github.com/aklomp/base64"
SRC_URI="https://github.com/aklomp/base64/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
