# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Fast encoder/decoder for the bittorrent data representation in pure Erlang"
HOMEPAGE="https://github.com/ratopi/bencoding"
SRC_URI="https://github.com/ratopi/bencoding/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
