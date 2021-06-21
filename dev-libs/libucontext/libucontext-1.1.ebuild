# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="ucontext implementation featuring glibc-compatible ABI"
HOMEPAGE="https://github.com/kaniini/libucontext"
SRC_URI="https://github.com/kaniini/libucontext/archive/refs/tags/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${P}
