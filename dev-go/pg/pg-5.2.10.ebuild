# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/pg.v5"

DESCRIPTION="PostgreSQL client for Golang"
HOMEPAGE="https://github.com/go-pg/pg"
SRC_URI="https://github.com/go-pg/pg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/inflection
"
RDEPEND="${DEPEND}"
