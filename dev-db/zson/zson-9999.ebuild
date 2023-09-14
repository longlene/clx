# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="ZSON is a PostgreSQL extension for transparent JSONB compression"
HOMEPAGE="https://github.com/afiskon/zson"
SRC_URI=""

EGIT_REPO_URI="https://github.com/afiskon/zson.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"
