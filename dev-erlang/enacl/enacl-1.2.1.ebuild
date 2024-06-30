# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang bindings for NaCl / libsodium"
HOMEPAGE="https://github.com/jlouis/enacl"
SRC_URI="https://github.com/jlouis/enacl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libsodium
"
RDEPEND="${DEPEND}"
BDEPEND=""
