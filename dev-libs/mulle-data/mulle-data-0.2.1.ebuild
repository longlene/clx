# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A collection of hash functions"
HOMEPAGE="https://github.com/mulle-c/mulle-data"
SRC_URI="https://github.com/mulle-c/mulle-data/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/mulle-c11
"
RDEPEND="${DEPEND}"
BDEPEND=""
