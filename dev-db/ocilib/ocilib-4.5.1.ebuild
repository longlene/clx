# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Open source C and C++ library for accessing Oracle db"
HOMEPAGE="http://vrogier.github.io/ocilib/"
SRC_URI="https://github.com/vrogier/ocilib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/oracle-instantclient
"
RDEPEND="${DEPEND}"
