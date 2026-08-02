# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Minimal header-only C++ library for terminal colors"
HOMEPAGE="https://github.com/agauniyal/rang"
SRC_URI="https://github.com/agauniyal/rang/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

src_install() {
	insinto /usr/include
	doins include/rang.hpp
	dodoc README.md
}
