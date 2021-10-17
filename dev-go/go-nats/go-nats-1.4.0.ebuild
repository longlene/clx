# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
EGO_PN="github.com/nats-io/go-nats"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Golang client for NATS, the cloud native messaging system"
HOMEPAGE="https://nats.io"
SRC_URI="https://github.com/nats-io/go-nats/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/nuid
"
RDEPEND="${DEPEND}"
