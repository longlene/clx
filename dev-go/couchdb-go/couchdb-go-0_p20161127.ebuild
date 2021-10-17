# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/rhinoman/couchdb-go"
EGIT_COMMIT="6ffbef452d1d3057b52386eb3f98099348551f6f"

DESCRIPTION="CouchDB driver for Go"
HOMEPAGE="https://github.com/rhinoman/couchdb-go"
SRC_URI="https://github.com/rhinoman/couchdb-go/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
