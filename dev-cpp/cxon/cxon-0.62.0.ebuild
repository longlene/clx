# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple, extensible and fast C++11 serialization library with JSON as a"
HOMEPAGE="https://github.com/oknenavin/cxon"
SRC_URI="https://github.com/oknenavin/cxon/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" prefix=/usr install
	einstalldocs
}
