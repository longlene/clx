# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="b0c2bc5979f008a39300b01a0dc3e967c6257be9"

DESCRIPTION="Continuation Queues"
HOMEPAGE="https://github.com/wahern/cqueues"
SRC_URI="https://github.com/wahern/cqueues/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
