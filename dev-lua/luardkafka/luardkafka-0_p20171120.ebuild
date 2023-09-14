# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="9618991b1f46765e2041ef0301ef8a89d04e3437"

DESCRIPTION="Lua binding for librdkafka"
HOMEPAGE="https://github.com/mistsv/luardkafka"
SRC_URI="https://github.com/mistsv/luardkafka/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r rdkafka
}
