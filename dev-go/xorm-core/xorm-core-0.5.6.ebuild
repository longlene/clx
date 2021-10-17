# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/go-xorm/core"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Lightweight & Compitable wrapper of database/sql"
HOMEPAGE="https://github.com/go-xorm/core"
SRC_URI="https://github.com/go-xorm/core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
