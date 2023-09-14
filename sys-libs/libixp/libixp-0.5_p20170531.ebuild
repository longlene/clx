# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib toolchain-funcs vcs-snapshot

EGIT_COMMIT="b54b30631f6df1ea4df8e5b0b35816039b6f8bd2"

DESCRIPTION="A stand-alone client/server 9P library including ixpc client"
HOMEPAGE="http://libs.suckless.org/libixp"
SRC_URI="https://github.com/0intro/libixp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND=""
DEPEND="app-arch/xz-utils"

pkg_setup() {
	myixpconf=(
		PREFIX="/usr"
		LIBDIR="/usr/$(get_libdir)"
		CC="$(tc-getCC) -c"
		LD="$(tc-getCC) ${LDFLAGS}"
		AR="$(tc-getAR) crs"
		MAKESO="1"
		SOLDFLAGS="-shared"
		)
}

src_prepare() {
	eapply_user
	sed -e 's:ixp_serve9pconn:ixp_serve9conn:' \
		-e '69s:uint32_t:unsigned long:' \
		-i include/ixp.h || die
}

src_compile() {
	emake "${myixpconf[@]}"
}

src_install() {
	emake "${myixpconf[@]}" DESTDIR="${D}" install
	dolib.so lib/libixp{,_pthread}.so
	dodoc NEWS
}
