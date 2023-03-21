# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Erlang MQTT v5.0 Client"
HOMEPAGE="https://emqx.io/"
SRC_URI="https://github.com/emqx/emqtt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_install() {
	insinto /usr/$(get_libdir)
	doins -r _build/emqtt/rel/emqtt
	dosym  /usr/$(get_libdir)/emqtt/bin/emqtt /usr/bin/emqtt
	dodoc README.md
}
