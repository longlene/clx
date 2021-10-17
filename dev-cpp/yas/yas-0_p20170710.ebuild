# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="c1698b564bf6950de1b86761b3f5671884253739"

DESCRIPTION="Yet Another Serialization"
HOMEPAGE="https://github.com/niXman/yas"
SRC_URI="https://github.com/niXman/yas/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}
