# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Erlang bindings for NaCl / libsodium"
HOMEPAGE="https://github.com/jlouis/enacl"
SRC_URI="https://github.com/jlouis/enacl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libsodium
"
BDEPEND=""
