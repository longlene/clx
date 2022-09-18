# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A micro microbenchmarking library for C++11 in a single header file"
HOMEPAGE="https://github.com/iboB/picobench"
SRC_URI="https://github.com/iboB/picobench/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/*
	dodoc README.md
}
