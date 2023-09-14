# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="de0856dc82d9746d5aab013fb4763b297feb136b"

DESCRIPTION="A lightweight DNS-over-HTTPS proxy"
HOMEPAGE="https://github.com/aarond10/https_dns_proxy"
SRC_URI="https://github.com/aarond10/https_dns_proxy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libev
	net-dns/c-ares
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${BUILD_DIR}/https_dns_proxy
	dodoc README.md
}
