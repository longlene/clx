# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Erlang client for the etcd API v3"
HOMEPAGE="https://github.com/zhongwencool/eetcd"
SRC_URI="https://github.com/zhongwencool/eetcd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/gun
"
BDEPEND=""
