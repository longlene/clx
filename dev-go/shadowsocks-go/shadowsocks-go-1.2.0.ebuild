# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/shadowsocks/shadowsocks-go/..."

DESCRIPTION="go port of shadowsocks"
HOMEPAGE="https://github.com/shadowsocks/shadowsocks-go"
SRC_URI="https://github.com/shadowsocks/shadowsocks-go/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/chacha20
"
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/shadowsocks-{local,server,httpget}
	insinto /etc/${PN}
	doins src/${EGO_PN%/*}/sample-config/{client-multi-server,server-multi-port}.json
}
