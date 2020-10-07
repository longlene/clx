# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A DNS over HTTPS resolver for glibc"
HOMEPAGE="https://github.com/dimkr/nss-tls"
SRC_URI="https://github.com/dimkr/nss-tls/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/glib
	net-libs/libsoup
"
RDEPEND="${DEPEND}"
BDEPEND=""
