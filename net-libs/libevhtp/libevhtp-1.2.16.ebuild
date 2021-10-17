# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit cmake

DESCRIPTION="A more flexible replacement for libevent's httpd API"
HOMEPAGE="https://github.com/criticalstack/libevhtp"
SRC_URI="https://github.com/criticalstack/libevhtp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl thread regex shared defer"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libevent
ssl? ( dev-libs/openssl )
regex? ( dev-libs/oniguruma )"

src_configure() {
	local mycmakeargs=(
	$(cmake_useno ssl EVHTP_DISABLE_SSL)
	$(cmake_useno thread EVHTP_DISABLE_EVTHR)
	$(cmake_useno regex EVHTP_DISABLE_REGEX)
	$(cmake_useno shared EVHTP_DISABLE_SHARED)
	$(cmake_use_use defer DEFER_ACCEPT)
	)
	cmake_src_configure

}
