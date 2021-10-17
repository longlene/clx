# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Apple Push Notification Server for Erlang"
HOMEPAGE="https://github.com/inaka/apns4erl"
SRC_URI="https://github.com/inaka/${PN}4erl/archive/${PV}.tar.gz -> ${PN}4erl-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/chatterbox-0.7.0
	>=dev-erlang/jsx-2.9.0
	>=dev-erlang/base64url-0.0.1
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}4erl-${PV}

DOCS=( CHANGELOG.md )

