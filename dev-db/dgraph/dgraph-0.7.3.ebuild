# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/dgraph-io/dgraph/..."

DESCRIPTION="Graph database for production environment"
HOMEPAGE="https://dgraph.io/"
SRC_URI="https://github.com/dgraph-io/dgraph/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-net
	dev-go/grpc
"
RDEPEND="${DEPEND}"
