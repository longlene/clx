# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/olivere/elastic.v5"

DESCRIPTION="Elasticsearch client for Go"
HOMEPAGE="https://github.com/olivere/elastic"
SRC_URI="https://github.com/olivere/elastic/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-net
"
RDEPEND="${DEPEND}"
