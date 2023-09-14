# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eb5fbea3592b74cdb0458b7bcdeb70f0423a8183"

DESCRIPTION="Video file decoding in Common Lisp"
HOMEPAGE="https://github.com/varjagg/cl-video"
SRC_URI="https://github.com/varjagg/cl-video/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/cl-riff
	dev-lisp/cl-jpeg
	dev-lisp/flexi-streams
	dev-lisp/skippy
	dev-lisp/clx
	dev-lisp/cl-portaudio
"
