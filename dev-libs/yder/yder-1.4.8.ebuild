# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Logging library written in C"
HOMEPAGE="https://github.com/babelouest/yder"
SRC_URI="https://github.com/babelouest/yder/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND="
	dev-libs/orcania
	dev-libs/jansson
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DWITH_JOURNALD=$(usex systemd)
	)
	cmake-utils_src_configure
}
