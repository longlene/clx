# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/graphql-go/graphql"

DESCRIPTION="An implementation of GraphQL for Go"
HOMEPAGE="https://github.com/graphql-go/graphql"
SRC_URI="https://github.com/graphql-go/graphql/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
