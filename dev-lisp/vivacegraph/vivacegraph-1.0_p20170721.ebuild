# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="06ea228ef3df837c40b7f185dc8cc91cbc1c0251"

DESCRIPTION="Open source Common Lisp graph database"
HOMEPAGE="https://github.com/kraison/vivace-graph-v3"
SRC_URI="https://github.com/kraison/vivace-graph-v3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/trivial-shell
	dev-lisp/iterate
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/cl-ppcre
	dev-lisp/uuid
	dev-lisp/split-sequence
	dev-lisp/cl-store
	dev-lisp/local-time
	dev-lisp/ieee-floats
	dev-lisp/cl-json
	dev-lisp/hunchentoot
	dev-lisp/ningle
	dev-lisp/clack
	dev-lisp/log4cl
	dev-lisp/usocket
	dev-lisp/md5
"
