# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="stdio over XMPP"
HOMEPAGE="https://github.com/msantos/xmppipe"
SRC_URI="https://github.com/msantos/xmppipe/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libstrophe"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin xmppipe
	einstalldocs
}
