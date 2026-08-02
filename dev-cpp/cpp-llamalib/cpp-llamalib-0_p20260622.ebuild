# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="5a27592fada09958ce90f3456d4cdfc7681bc696"

DESCRIPTION="C++17 single-file header-only wrapper for llama.cpp"
HOMEPAGE="https://github.com/yhirose/cpp-llamalib"
SRC_URI="https://github.com/yhirose/cpp-llamalib/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/cpp-llamalib-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sci-misc/llama-cpp"

src_install() {
	insinto /usr/include
	doins cpp-llamalib.h
	einstalldocs
}
