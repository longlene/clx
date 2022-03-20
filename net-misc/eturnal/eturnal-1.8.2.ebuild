# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="STUN / TURN standalone server"
HOMEPAGE="https://github.com/processone/eturnal"
SRC_URI="https://github.com/processone/eturnal/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	acct-user/eturnal
	acct-group/eturnal
	>=dev-erlang/stun-1.0.42
	>=dev-erlang/conf-0.2.1
	>=dev-erlang/recon-2.5.1
	>=dev-erlang/influx_udp-1.1.1
"
BDEPEND="
	dev-util/rebar:3
"

src_prepare() {
	default
	sed -e 's#/opt/eturnal#/usr/lib/eturnal#' -i build.config
}

src_compile() {
	SKIP_DEPS=true rebar3 as distro release
}

src_install() {
	insinto /usr/lib/eturnal
	doins -r _build/default/distro/rel/eturnal/{bin,lib,releases,}

	insinto /etc
	doins _build/default/distro/rel/eturnal/etc/eturnal.yml

	newinitd _build/default/distro/rel/eturnal/etc/init.d/eturnal

	dodoc -r _build/default/distro/rel/eturnal/doc
}

