# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple implementation of msgpack of C"
HOMEPAGE="https://github.com/libmpack/libmpack"
SRC_URI="https://github.com/libmpack/libmpack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PREFIX=/usr
config=release

src_compile() {
	emake config=release DESTDIR=${DESTDIR}
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr LIBDIR=/usr/$(get_libdir) install
}
