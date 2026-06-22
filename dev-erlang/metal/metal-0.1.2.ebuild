# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Lightweight Erlang server behaviour"
HOMEPAGE="https://github.com/lpgauth/metal"
SRC_URI="https://github.com/lpgauth/metal/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

src_prepare() {
	rebar3_src_prepare
	rm -r bin || die
}
