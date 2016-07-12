# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="RethinkDB driver for C++"
HOMEPAGE="https://github.com/AtnNn/librethinkdbxx"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/AtnNn/librethinkdbxx.git"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/rethinkdb"
RDEPEND="${DEPEND}"
