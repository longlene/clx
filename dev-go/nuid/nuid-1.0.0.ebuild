# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
EGO_PN="github.com/nats-io/nuid"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="NATS Unique Identifiers"
HOMEPAGE="https://github.com/nats-io/nuid"
SRC_URI="https://github.com/nats-io/nuid/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dodoc README.md
}
