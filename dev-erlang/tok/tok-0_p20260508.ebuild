# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

COMMIT="c5d83e6c419fde296437660af53e5099169da706"

DESCRIPTION="Pure Erlang HuggingFace tokenizer (WordPiece/BPE)"
HOMEPAGE="https://github.com/roquess/tok"
SRC_URI="https://github.com/roquess/tok/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/tok-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/thoas"
