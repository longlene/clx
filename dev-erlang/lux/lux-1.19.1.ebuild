# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

DESCRIPTION="LUcid eXpect scripting"
HOMEPAGE="https://github.com/hawk/lux"
SRC_URI="https://github.com/hawk/lux/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/erlang
"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	ETCDIR=/etc/lux DESTDIR=${D}/usr/lib/lux emake install
	dosym /usr/lib/lux/bin/lux /usr/bin/lux
}
