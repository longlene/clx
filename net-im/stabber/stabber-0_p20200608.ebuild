# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

EGIT_COMMIT="3e5c2200715666aad403d0076e8ab584b329965e"

DESCRIPTION="Stubbed XMPP Server"
HOMEPAGE="https://github.com/profanity-im/stabber"
SRC_URI="https://github.com/profanity-im/stabber/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/expat
	dev-libs/glib
	net-libs/libmicrohttpd
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoconf
}
