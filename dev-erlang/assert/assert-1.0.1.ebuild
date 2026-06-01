# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A test assertion library for Erlang"
HOMEPAGE="https://github.com/WhatsApp/assert"
SRC_URI="https://github.com/WhatsApp/assert/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
