# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

CLPACKAGE="whereiseveryone.command-line-args"

DESCRIPTION="Automatically create a command-line-argument parser for a given Common Lisp function definition"
HOMEPAGE="https://git.sr.ht/~whereiseveryone/command-line-args"
SRC_URI="https://git.sr.ht/~whereiseveryone/command-line-args/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/str
	dev-lisp/charje_documentation
	dev-lisp/trivia
"
BDEPEND=""

S="${WORKDIR}"/${PN}-v${PV}
