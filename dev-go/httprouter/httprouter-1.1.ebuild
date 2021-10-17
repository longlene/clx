# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/julienschmidt/httprouter"

DESCRIPTION="A high performance HTTP request router that scales well"
HOMEPAGE="https://github.com/julienschmidt/httprouter"
SRC_URI="https://github.com/julienschmidt/httprouter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
