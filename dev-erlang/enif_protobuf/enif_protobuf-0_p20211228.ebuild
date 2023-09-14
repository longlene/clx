# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="724f9c458b76a68951f2b16e1b9d7d2b6065597a"

DESCRIPTION="A Google Protobuf implementation with enif"
HOMEPAGE="https://github.com/jg513/enif_protobuf"
SRC_URI="https://github.com/jg513/enif_protobuf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	rebar_src_compile
	rm priv/enif_protobuf-${PV}.so
}
