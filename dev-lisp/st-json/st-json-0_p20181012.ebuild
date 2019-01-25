# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d0f834f1f32d9386e23eae17d04e1ba4119e6ba5"

DESCRIPTION="JSON for Common Lisp"
HOMEPAGE="http://marijnhaverbeke.nl/st-json"
SRC_URI="https://github.com/marijnh/st-json/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"