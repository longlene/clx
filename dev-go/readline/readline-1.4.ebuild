# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/readline.v1"

DESCRIPTION="Readline is a pure go implementation for GNU-Readline kind library"
HOMEPAGE="https://github.com/chzyer/readline"
SRC_URI="https://github.com/chzyer/readline/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
