# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="2903870057d2f1f109b245650be29e856dc8b646"

DESCRIPTION="CRC util"
HOMEPAGE="https://github.com/cloudera/crcutil"
SRC_URI="https://github.com/cloudera/crcutil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	./autogen.sh
}
