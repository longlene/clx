# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

EGIT_COMMIT="dc211bbff2af3218e51fa5a925f6b3ba5730ac89"

DESCRIPTION="A library to support streaming data applications"
HOMEPAGE="https://github.com/troydhanson/kvspool"
SRC_URI="https://github.com/troydhanson/kvspool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/shr
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
