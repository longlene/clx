# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4af018048e891f41d77e7d680ed3aeb639e1eedb"

DESCRIPTION="Html-entities lets you encode and decode entities in HTML"
HOMEPAGE="https://github.com/BnMcGn/html-entities/"
SRC_URI="https://github.com/BnMcGn/html-entities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"
