# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="efb819e04b9dcc07eb8833bdb9d9a73df225b276"

DESCRIPTION="Minimal implementation of the QUIC protocol"
HOMEPAGE="https://github.com/private-octopus/picoquic"
SRC_URI="https://github.com/private-octopus/picoquic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/picotls
"
RDEPEND="${DEPEND}"
BDEPEND=""
