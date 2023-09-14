# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/jszwec/csvutil"

DESCRIPTION="csvutil provides fast and idiomatic mapping between CSV and Go (golang) values"
HOMEPAGE="https://github.com/jszwec/csvutil"
SRC_URI="https://github.com/jszwec/csvutil/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
