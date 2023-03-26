# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C17 compiler implementation from scratch"
HOMEPAGE="https://github.com/protopopov1122/kefir"
SRC_URI="https://github.com/protopopov1122/kefir/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/\"\$(DESTDIR)\"\/lib/{s#\"\$(DESTDIR)\"/lib#\"\$(DESTDIR)\"/$(get_libdir)#}" \
		-i install.mk
}

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${D}"/usr install
}
