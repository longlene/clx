# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/match"
EGIT_COMMIT="173748da739a410c5b0b813b956f89ff94730b4c"

DESCRIPTION="Simple string pattern matcher for Go"
HOMEPAGE="https://github.com/tidwall/match"
SRC_URI="https://github.com/tidwall/match/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
