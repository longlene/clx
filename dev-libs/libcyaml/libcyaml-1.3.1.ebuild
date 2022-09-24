# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C library for reading and writing YAML"
HOMEPAGE="https://github.com/tlsa/libcyaml"
SRC_URI="https://github.com/tlsa/libcyaml/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libyaml
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr LIBDIR=$(get_libdir) install
}
