# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ embedding of Wasmtime"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime-cpp"
SRC_URI="https://github.com/bytecodealliance/wasmtime-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/wasmtime
"
BDEPEND=""

src_install() {
	doheader include/wasmtime.hh
}
