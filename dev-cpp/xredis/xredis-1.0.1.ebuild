# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Redis C++ client, support the data slice storage, support the connection pool"
HOMEPAGE="https://github.com/0xsky/xredis"
SRC_URI="https://github.com/0xsky/xredis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/hiredis"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#$(ARCH)##' \
		-e "/INSTALL_LIBRARY_PATH=/{s#/lib#/$(get_libdir)#}" \
		-e "/OBJ=/{s#.cpp#.o#}" \
		-i makefile
}

src_install() {
	emake PREFIX="${D}"/usr install
}

