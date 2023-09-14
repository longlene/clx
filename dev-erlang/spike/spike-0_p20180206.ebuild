# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3 vcs-snapshot

EGIT_COMMIT="2db7cca4e23b3718915bdbaa85fbde301a967067"

DESCRIPTION="Remotely inject erlang code"
HOMEPAGE="https://github.com/ruanpienaar/spike"
SRC_URI="https://github.com/ruanpienaar/spike/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
#dev-erlang/hawk
BDEPEND=""

# TODO 
# escriptize fix
