# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="Elixir grammar for tree-sitter"
HOMEPAGE="https://github.com/elixir-lang/tree-sitter-elixir"
SRC_URI="https://github.com/elixir-lang/tree-sitter-elixir/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

export PARSER_NAME="elixir"

