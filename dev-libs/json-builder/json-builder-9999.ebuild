# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="The serializing counterpart to json-parser"
HOMEPAGE="http://github.com/udp/json-parser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/udp/json-builder.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/json-parser"
RDEPEND="${DEPEND}"
