# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/nats-io/nats-top"

DESCRIPTION="Top like program monitor for NATS"
HOMEPAGE="https://github.com/nats-io/nats-top"
SRC_URI="https://github.com/nats-io/nats-top/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin nats-top
	dodoc src/${EGO_PN}/readme.md
}
