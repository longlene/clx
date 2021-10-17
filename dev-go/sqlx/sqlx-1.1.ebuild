# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/jmoiron/sqlx"

DESCRIPTION="general purpose extensions to golang's database/sql"
HOMEPAGE="http://jmoiron.github.io/sqlx/"
SRC_URI="https://github.com/jmoiron/sqlx/archive/sqlx-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
