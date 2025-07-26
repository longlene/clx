# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="Tree sitter grammar for Godot's GDScript"
HOMEPAGE="https://github.com/PrestonKnopp/tree-sitter-gdscript"
SRC_URI="https://github.com/PrestonKnopp/tree-sitter-gdscript/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
