# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="49f6c41028734de8abcec76a36a860662f408ee5"

DESCRIPTION="A parallelism library for Common Lisp"
HOMEPAGE="https://github.com/nahiluhmot/cl-parallel"
SRC_URI="https://github.com/nahiluhmot/cl-parallel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"

