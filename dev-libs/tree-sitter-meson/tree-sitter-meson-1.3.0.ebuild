# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="Meson grammar for tree-sitter"
HOMEPAGE="https://github.com/tree-sitter-grammars/tree-sitter-meson"
SRC_URI="https://github.com/tree-sitter-grammars/tree-sitter-meson/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
