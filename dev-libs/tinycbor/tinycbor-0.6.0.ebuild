# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Concise Binary Object Representation (CBOR) Library"
HOMEPAGE="https://github.com/intel/tinycbor"
SRC_URI="https://github.com/intel/tinycbor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/prefix =/{s#/usr/local#/usr#}' \
		-e "/libdir =/{s#/lib#/$(get_libdir)#}" \
		-i Makefile
}
