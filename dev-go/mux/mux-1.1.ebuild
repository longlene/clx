# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gorilla/mux"

DESCRIPTION="A powerful URL router and dispatcher for golang"
HOMEPAGE="https://github.com/gorilla/mux"
SRC_URI="https://github.com/gorilla/mux/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/context
"
RDEPEND="${DEPEND}"
