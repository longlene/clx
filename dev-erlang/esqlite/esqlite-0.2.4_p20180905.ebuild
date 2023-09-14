# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="ab25c2d2b67cd4aa09545a33599821467f277240"

DESCRIPTION="Erlang NIF for sqlite"
HOMEPAGE="https://github.com/mmzeeman/esqlite"
SRC_URI="https://github.com/mmzeeman/esqlite/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
