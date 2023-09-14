# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="TinyCrypt Cryptographic Library"
HOMEPAGE="https://github.com/01org/tinycrypt"
SRC_URI="https://github.com/01org/tinycrypt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/ENABLE_TESTS=/{s#true#$(usex test true false)#}" config.mk || die "prepare failed"
}
	
src_install() {
	dolib.a lib/libtinycrypt.a
	insinto /usr
	doins -r lib/include
	dodoc README
}
