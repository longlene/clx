# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="055a0d34cdfe9f4a464fc9ca1e2a2a183670da32"

DESCRIPTION="Common Lisp Content Addressable Memory"
HOMEPAGE="https://github.com/stablecross/cam"
SRC_URI="https://github.com/stablecross/cam/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
