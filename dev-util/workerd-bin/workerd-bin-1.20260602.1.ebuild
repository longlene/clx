# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="JavaScript/Wasm runtime that powers Cloudflare Workers (pre-built binary)"
HOMEPAGE="https://github.com/cloudflare/workerd"
SRC_URI="https://registry.npmjs.org/@cloudflare/workerd-linux-64/-/workerd-linux-64-${PV}.tgz -> ${P}.tgz"

S="${WORKDIR}/package"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="strip"

QA_PREBUILT="usr/bin/workerd"

src_install() {
	newbin bin/workerd workerd
}
