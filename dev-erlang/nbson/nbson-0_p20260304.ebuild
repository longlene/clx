# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="7aab5d1acf4703795b70d2db182bac7494973848"

inherit rebar3

DESCRIPTION="Erlang encoder/decoder for BSON files"
HOMEPAGE="https://github.com/nomasystems/nbson"
SRC_URI="https://github.com/nomasystems/nbson/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
