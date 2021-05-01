# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ffc5a5f933be79e7188f7b5b89e0010609a473b3"

DESCRIPTION="A simple gap-based text buffer"
HOMEPAGE="https://github.com/stacksmith/cl-textbuffer"
SRC_URI="https://github.com/stacksmith/cl-textbuffer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
"
