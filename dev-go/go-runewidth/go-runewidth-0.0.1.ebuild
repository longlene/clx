# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mattn/go-runewidth"

DESCRIPTION="Provides functions to get fixed width of the character or string"
HOMEPAGE="https://github.com/mattn/go-runewidth"
SRC_URI="https://github.com/mattn/go-runewidth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
