# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A minimal S3 client library in Erlang"
HOMEPAGE="https://github.com/JanHenryNystrom/jhn_s3c"
SRC_URI="https://github.com/JanHenryNystrom/jhn_s3c/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/hackney
	dev-erlang/jhn_stdlib
"

src_prepare() {
	rebar3_src_prepare
	# Upstream writes {vsn, "git"} (a string), which rebar_set_vsn's
	# 'vsn, git' pattern does not match - set the real version.
	sed -i -e "s/{vsn, \"git\"}/{vsn, \"${PV}\"}/" src/${PN}.app.src || die

	# The eclass installs from _build/${REBAR_PROFILE} - the default
	# base dir - while upstream builds into .build/.
	sed -i -e 's|{base_dir, ".build"}|{base_dir, "_build"}|' rebar.config || die
}
