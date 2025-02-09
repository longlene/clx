# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker systemd tmpfiles

DESCRIPTION="Cloudflare Tunnel client (formerly Argo Tunnel)"
HOMEPAGE="https://github.com/cloudflare/cloudflared"
SRC_URI="https://github.com/cloudflare/cloudflared/releases/download/${PV}/cloudflared-linux-amd64.deb
	-> cloudflared-${PV}-linux-amd64.deb"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* amd64"

RESTRICT="strip"
QA_PREBUILT="usr/bin/cloudflared"

src_install() {
	dobin usr/bin/cloudflared
	doman usr/share/man/man1/cloudflared.1
	diropts -m0600
	insinto /etc/cloudflared
	newins "${FILESDIR}"/config.yml config-example.yml
	newinitd "${FILESDIR}"/cloudflared.initd cloudflared
	newconfd "${FILESDIR}"/cloudflared.confd cloudflared
	systemd_newunit "${FILESDIR}"/cloudflared.service cloudflared@.service

	dotmpfiles "${FILESDIR}/cloudflared.tmpfiles.conf"
}
