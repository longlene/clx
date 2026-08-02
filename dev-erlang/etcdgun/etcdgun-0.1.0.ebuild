# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An etcd client built on top of gun and egrpc"
HOMEPAGE="https://github.com/belltoy/etcdgun"
SRC_URI="https://github.com/belltoy/etcdgun/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/egrpc
	dev-erlang/gun
"

src_prepare() {
	rebar3_src_prepare
	# Strip project_plugins to avoid pulling incompatible deps
	# (rebar3_egrpc_plugin pulls erlware_commons incompatible with newer Erlang)
	sed -i '/{project_plugins/,/}]}/d' rebar.config || die
}
