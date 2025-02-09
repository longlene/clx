# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="19f6c40745b909beb8e215142a280d47d1d828bc"

DESCRIPTION="Compatibility library to run things in the main thread"
HOMEPAGE="https://github.com/Shinmera/trivial-main-thread"
SRC_URI="https://github.com/Shinmera/trivial-main-thread/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/bordeaux-threads
	dev-lisp/simple-tasks
"
