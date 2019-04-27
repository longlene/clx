# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="45db6aea47bcd59d8ba4d7657baca854a5ffeacd"

DESCRIPTION="A test framework for Common Lisp"
HOMEPAGE="https://github.com/capitaomorte/fiasco"
SRC_URI="https://github.com/capitaomorte/fiasco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
