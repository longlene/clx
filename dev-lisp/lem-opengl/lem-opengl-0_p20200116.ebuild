# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="006316d611b5eca0546e1bb2fd94ee7b11a3c365"

DESCRIPTION="OpenGL frontend for the Lem text editor"
HOMEPAGE="https://github.com/gregcman/lem-opengl"
SRC_URI="https://github.com/gregcman/lem-opengl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-clipboard
	dev-lisp/minilem
	dev-lisp/uncommon-lisp
	dev-lisp/sucle
"
BDEPEND=""
