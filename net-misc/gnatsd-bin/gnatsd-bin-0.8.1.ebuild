# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="High-Performance server for NATS"
HOMEPAGE="https://nats.io"
SRC_URI="
	amd64? ( https://github.com/nats-io/gnatsd/releases/download/v${PV}/gnatsd-v${PV}-linux-amd64.zip )
	x86? ( https://github.com/nats-io/gnatsd/releases/download/v${PV}/gnatsd-v${PV}-linux-386.zip )
	arm? ( https://github.com/nats-io/gnatsd/releases/download/v${PV}/gnatsd-v${PV}-linux-arm.zip )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="!net-misc/gnatsd"
RDEPEND="${DEPEND}"

# TODO init.d file needed
src_install() {
	dobin gnatsd
	dodoc README.md
}
