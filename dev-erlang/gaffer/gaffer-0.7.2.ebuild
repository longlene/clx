# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A reliable job queue"
HOMEPAGE="https://github.com/eproxus/gaffer"
SRC_URI="https://github.com/eproxus/gaffer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/keysmith-0.6.1
	>=dev-erlang/mapz-2.4.0
"

src_prepare() {
	# app.src uses {vsn, semver} which requires git history; pin to release version
	sed -i "s/{vsn, semver}/{vsn, \"${PV}\"}/" src/gaffer.app.src || die
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
}
