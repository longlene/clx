# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fizzy aims to be a fast, deterministic, and pedantic WebAssembly interpreter written in C++"
HOMEPAGE="https://github.com/wasmx/fizzy"
SRC_URI="https://github.com/wasmx/fizzy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

