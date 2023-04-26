# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit meson

DESCRIPTION="Service monitoring system"
HOMEPAGE="https://github.com/davmac314/dinit"
SRC_URI="https://github.com/davmac314/dinit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/BUILD_OPTS/{s#-Os ##}' \
		-i configs/mconfig.Linux.sh
}

src_install() {
	emake DESTDIR="${D}" STRIPOPTS="" install
}
