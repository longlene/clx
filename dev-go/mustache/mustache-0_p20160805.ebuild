# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hoisie/mustache"
EGIT_COMMIT="6375acf62c69d9d3ad20fd0599d82ca94ea12284"

DESCRIPTION="The mustache template language in Go"
HOMEPAGE="https://github.com/hoisie/mustache"
SRC_URI="https://github.com/hoisie/mustache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
