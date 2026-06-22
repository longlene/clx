# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="WireGuard-based overlay network with SSO, MFA and granular access controls"
HOMEPAGE="https://netbird.io https://github.com/netbirdio/netbird"
SRC_URI="
	amd64? ( https://github.com/netbirdio/netbird/releases/download/v${PV}/netbird_${PV}_linux_amd64.tar.gz )
	arm64? ( https://github.com/netbirdio/netbird/releases/download/v${PV}/netbird_${PV}_linux_arm64.tar.gz )
"
S="${WORKDIR}"

LICENSE="AGPL-3 BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror strip"

QA_PREBUILT="usr/bin/netbird"

src_install() {
	dobin netbird
	dodoc README.md
}
