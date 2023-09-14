# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Filesystem Activities"
HOMEPAGE="https://github.com/synrc/active"
SRC_URI="https://github.com/synrc/active/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/mad
	dev-erlang/fs
"
BDEPEND=""
