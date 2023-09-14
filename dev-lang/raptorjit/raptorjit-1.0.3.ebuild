# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A dynamic language for system programming"
HOMEPAGE="https://github.com/raptorjit/raptorjit"
SRC_URI="https://github.com/raptorjit/raptorjit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/PREFIX=/{s#/local##}' Makefile
	emake reusevm
}
