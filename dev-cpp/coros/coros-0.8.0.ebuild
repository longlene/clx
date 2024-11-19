# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An easy-to-use and fast library for task-based parallelism, utilizing coroutines"
HOMEPAGE="https://github.com/mtmucha/coros"
SRC_URI="https://github.com/mtmucha/coros/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/*
	einstalldocs
}
