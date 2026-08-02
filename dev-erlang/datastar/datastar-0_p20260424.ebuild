# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

COMMIT="fcc11f399294b305620a7c99ed633b898ce3889b"

DESCRIPTION="Erlang SDK for Datastar: SSE event builder and signal reader"
HOMEPAGE="https://github.com/Taure/datastar"
SRC_URI="https://github.com/Taure/datastar/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/datastar-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
