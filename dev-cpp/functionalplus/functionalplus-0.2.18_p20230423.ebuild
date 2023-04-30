# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="fe04df4b53433f27611801ee1507e977bddbe228"

DESCRIPTION="Functional Programming Library for C++"
HOMEPAGE="https://github.com/Dobiasd/FunctionalPlus"
SRC_URI="https://github.com/Dobiasd/FunctionalPlus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
