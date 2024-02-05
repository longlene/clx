# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A Software Defined Telecom Stack"
HOMEPAGE="https://github.com/signalwire/freeswitch"
SRC_URI="https://github.com/signalwire/freeswitch/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-db/postgresql
	media-libs/spandsp
	net-libs/sofia-sip
	media-libs/speex
	media-libs/speexdsp
	dev-libs/libedit
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
