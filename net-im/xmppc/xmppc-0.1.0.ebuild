# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Command Line Interface Tool for XMPP"
HOMEPAGE="https://codeberg.org/Anoxinon_e.V./xmppc"
SRC_URI="https://codeberg.org/Anoxinon_e.V./xmppc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-crypt/gpgme
	dev-libs/glib
	dev-libs/libstrophe
"
RDEPEND="${DEPEND}"
BDEPEND=""
