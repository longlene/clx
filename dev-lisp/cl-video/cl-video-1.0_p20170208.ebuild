# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6ff1c667202c873bb77c00fb4bb529424c428ce"

DESCRIPTION="Video file decoding in Common Lisp"
HOMEPAGE="https://github.com/varjagg/cl-video"
SRC_URI="https://github.com/varjagg/cl-video/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-riff
	dev-lisp/cl-jpeg
	dev-lisp/bordeaux-threads
	dev-lisp/flexi-streams
	dev-lisp/clx
"
