# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="1d320b3088988dff39bc4e2e2c4670e19ad03d0e"

DESCRIPTION="Transducers for C++"
HOMEPAGE="https://github.com/arximboldi/zug"
SRC_URI="https://github.com/arximboldi/zug/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
