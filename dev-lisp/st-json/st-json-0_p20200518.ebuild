# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5c5a4e220c666211aefbf6d8c3a5897a2f8e41f"

DESCRIPTION="JSON for Common Lisp"
HOMEPAGE="http://marijnhaverbeke.nl/st-json"
SRC_URI="https://github.com/marijnh/st-json/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
