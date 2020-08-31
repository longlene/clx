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
	dev-libs/libyaml
	dev-libs/openssl
	acct-user/eturnal
	acct-group/eturnal
"
BDEPEND="
	dev-util/rebar:3
"

RESTRICT=network-sandbox

src_prepare() {
	default
	sed -e 's#/opt/eturnal#/usr/lib/eturnal#' -i build.config
}

src_compile() {
	rebar3 as distro release
}

src_install() {
	insinto /usr/lib/eturnal
	doins -r _build/default/distro/rel/eturnal/{bin,lib,releases,}

	insinto /etc
	doins _build/default/distro/rel/eturnal/etc/eturnal.yml

	newinitd _build/default/distro/rel/eturnal/etc/init.d/eturnal

	dodoc -r _build/default/distro/rel/eturnal/doc
}

