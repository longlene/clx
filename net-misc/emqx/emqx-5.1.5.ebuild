# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An Open-Source, Cloud-Native, Distributed MQTT Message Broker for IoT"
HOMEPAGE="https://www.emqx.io/"
SRC_URI="https://github.com/emqx/emqx/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/erlang
"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_install() {
	rm _build/emqx/rel/emqx/bin/'*.git'
	insinto /usr/lib
	doins -r _build/emqx/rel/emqx/
	dosym /usr/lib/emqx/bin/emqx /usr/bin/emqx
	dodoc README.md
}
