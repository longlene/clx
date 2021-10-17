# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/allegro/bigcache"
EGIT_COMMIT="d3cb03c44fd6898b7bd6fcd148c211ac13524ff8"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/allegro/bigcache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
