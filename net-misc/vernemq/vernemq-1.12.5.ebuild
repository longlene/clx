# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user

DESCRIPTION="A distributed MQTT message broker based on Erlang/OTP"
HOMEPAGE="https://vernemq.com"
SRC_URI="https://github.com/vernemq/vernemq/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/erlang
"

RESTRICT=network-sandbox

pkg_setup() {
	enewgroup vernemq
	enewuser vernemq -1 /bin/sh /var/lib/vernemq vernemq
}

src_prepare() {
	default
	cat vars.config > vars.generated
	echo "{app_version, \"${PV}\"}." >> vars.generated
}

src_compile() {
	./rebar3 release
}

src_install() {
	insinto /usr/lib/vernemq
	doins -r _build/default/rel/vernemq/{bin,lib,releases,erts-*}

	for xbin in vernemq vmq-admin vmq-passwd ; do
		dosym /usr/lib/vernemq/bin/$xbin /usr/bin/$xbin
	done

	insinto /etc/vernemq
	doins _build/default/rel/vernemq/etc/*

	insinto /var/lib/vernemq
	doins -r _build/default/rel/vernemq/data

	insinto /usr/share/vernemq
	doins -r _build/default/rel/vernemq/share/*

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"

	dodoc README.md
}
