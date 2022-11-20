# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="4100eff3970f2a5807246500b2988bd56b7823c3"

DESCRIPTION="Postmodern immutable and persistent data structures for C++"
HOMEPAGE="https://sinusoid.es/immer"
SRC_URI="https://github.com/arximboldi/immer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
