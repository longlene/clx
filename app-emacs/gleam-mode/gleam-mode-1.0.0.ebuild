# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS="29.1"

inherit elisp

DESCRIPTION="Gleam major mode for Emacs using tree-sitter"
HOMEPAGE="https://github.com/gleam-lang/gleam-mode"
SRC_URI="https://github.com/gleam-lang/gleam-mode/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( Apache-2.0 GPL-3+ )"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"
