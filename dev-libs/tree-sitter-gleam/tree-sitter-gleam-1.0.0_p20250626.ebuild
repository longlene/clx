# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

EGIT_COMMIT="21e0e7ba6f4f60ee80934cb368aa13c00d370734"

DESCRIPTION="A tree-sitter grammar for the Gleam programming language"
HOMEPAGE="https://github.com/gleam-lang/tree-sitter-gleam"
SRC_URI="https://github.com/gleam-lang/tree-sitter-gleam/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-${EGIT_COMMIT}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
