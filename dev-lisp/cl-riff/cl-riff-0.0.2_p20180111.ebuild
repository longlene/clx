# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d1191c236095fd5a86daeb61a7fc4d4eee95f04"

DESCRIPTION="Reads Resource Interchange File Format (RIFF) files from Common Lisp"
HOMEPAGE="https://github.com/RobBlackwell/cl-riff"
SRC_URI="https://github.com/RobBlackwell/cl-riff/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
