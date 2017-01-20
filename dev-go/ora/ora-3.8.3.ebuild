# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/rana/ora.v3"

DESCRIPTION="An Oracle database driver for the Go programming language"
HOMEPAGE="https://github.com/rana/ora"
SRC_URI="https://github.com/rana/ora/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/oracle-instantclient
	dev-go/go-sync
"
RDEPEND="${DEPEND}"
