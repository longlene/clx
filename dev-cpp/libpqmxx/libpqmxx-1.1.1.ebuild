# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="A PostgreSQL client library written in Modern C++"
HOMEPAGE="https://github.com/pferdinand/libpqmxx"
SRC_URI="https://github.com/pferdinand/libpqmxx/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="
	dev-db/postgresql
	test? ( dev-libs/gtest )
"
RDEPEND="${DEPEND}"
