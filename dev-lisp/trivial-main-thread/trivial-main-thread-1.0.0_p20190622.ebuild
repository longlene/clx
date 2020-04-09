# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="25f114973bb69eb63e01d0bbfead31f8e682846a"

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
