# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="nanomsg-next-generation"
HOMEPAGE="https://github.com/nanomsg/nng"
SRC_URI="https://github.com/nanomsg/nng/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls"

DEPEND="
	tls? ( net-libs/mbedtls )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DNNG_ENABLE_TLS=$(usex tls)
	)
	cmake-utils_src_configure
}
