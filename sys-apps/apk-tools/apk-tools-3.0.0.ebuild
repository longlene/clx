# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Alpine Package Keeper"
HOMEPAGE="https://github.com/alpinelinux/apk-tools"
SRC_URI="https://github.com/alpinelinux/apk-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-lua -python zstd"

DEPEND="
	dev-libs/openssl
	virtual/zlib
	zstd? ( app-arch/zstd )
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature lua)
		$(meson_feature python)
		$(meson_feature zstd)
	)
	meson_src_configure
}
