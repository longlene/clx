# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A libev-based high performance SSL/TLS proxy"
HOMEPAGE="https://hitch-tls.org/"
SRC_URI="https://hitch-tls.org/source/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
	>=dev-libs/libev-4
"
RDEPEND="${DEPEND}"
BDEPEND=""

