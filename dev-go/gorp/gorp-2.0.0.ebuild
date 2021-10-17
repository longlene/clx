# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/gorp.v1"

DESCRIPTION="Go Relational Persistence"
HOMEPAGE="https://github.com/go-gorp/gorp"
SRC_URI="https://github.com/go-gorp/gorp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
