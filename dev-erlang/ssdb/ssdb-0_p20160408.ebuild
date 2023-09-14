# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="158b5b494794f241eded66a1ad04d97e9303975b"

DESCRIPTION="Erlang SSDB Client"
HOMEPAGE="https://github.com/kqqsysu/ssdb-erlang"
SRC_URI="https://github.com/kqqsysu/ssdb-erlang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-erlang/lager-3.1.0
"
