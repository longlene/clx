# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc8892257eeac546ab61cca3b920c039af96ef27"

DESCRIPTION="cl-fswatch is CFFI wrap of fswatch"
HOMEPAGE="https://github.com/muyinliu/cl-fswatch"
SRC_URI="https://github.com/muyinliu/cl-fswatch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	app-misc/fswatch
"
