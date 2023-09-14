# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="TLS/SSL/DTLS BoringSSL/OpenSSL-based NIF implementation of Erlang ssl module"
HOMEPAGE="https://github.com/silviucpp/erltls"
SRC_URI="https://github.com/silviucpp/erltls/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

export USE_BORINGSSL=0
