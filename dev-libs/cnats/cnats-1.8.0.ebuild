# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="A C client for NATS"
HOMEPAGE="http://www.nats.io"
SRC_URI="https://github.com/nats-io/nats.c/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="ssl"

DEPEND="
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" src/CMakeLists.txt
}

src_configure() {
	local mycmakears=(
	-DNATS_BUILD_WITH_TLS=$(usex ssl)
	)
	cmake-utils_src_configure
}
