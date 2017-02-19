# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/agtorre/gocolorize"

DESCRIPTION="Stateful ANSI coloring for Go"
HOMEPAGE="https://github.com/agtorre/gocolorize"
SRC_URI="https://github.com/agtorre/gocolorize/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
