# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="A GraphQL query parser in C++ with C and C++ APIs"
HOMEPAGE="https://github.com/graphql/libgraphqlparser"
SRC_URI="https://github.com/graphql/libgraphqlparser/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
