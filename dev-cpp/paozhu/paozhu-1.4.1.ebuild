# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ Web Framework"
HOMEPAGE="https://github.com/hggq/paozhu"
SRC_URI="https://github.com/hggq/paozhu/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/mysql-connector-c
"
RDEPEND="${DEPEND}"
BDEPEND=""
