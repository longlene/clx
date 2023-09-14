# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="44ba2079630b8b6839f9849508a437d5a07a60ee"

DESCRIPTION="Scalaris, a distributed, transactional key-value store"
HOMEPAGE="https://github.com/scalaris-team/scalaris"
SRC_URI="https://github.com/scalaris-team/scalaris/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	keepdir /var/lib/run
	keepdir /var/lib/log/scalaris
}
