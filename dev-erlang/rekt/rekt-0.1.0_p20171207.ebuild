# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="311ff756a3f33543fe4b8a80d4642f204a6bcec4"

DESCRIPTION="Erlang Record Extender"
HOMEPAGE="https://github.com/nitrogen/rekt"
SRC_URI="https://github.com/nitrogen/rekt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
