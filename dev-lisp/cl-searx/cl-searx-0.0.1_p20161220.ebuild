# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b01ac83f5b17e125869d57e5312bbfea15eb90f5"

DESCRIPTION="A CLI interface with searx.me"
HOMEPAGE="https://github.com/SamSkulls/cl-searx"
SRC_URI="https://github.com/SamSkulls/cl-searx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-store
	dev-lisp/cl-ppcre
	dev-lisp/drakma
	dev-lisp/cl-json
"
