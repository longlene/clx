# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="93fc3b7e655d4b917bca1bcc5a232206c2ffd8aa"

DESCRIPTION="SuperCollider client for Common Lisp"
HOMEPAGE="https://github.com/byulparan/cl-collider"
SRC_URI="https://github.com/byulparan/cl-collider/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/flexi-streams
	dev-lisp/ieee-floats
	dev-lisp/scheduler
	dev-lisp/simple-utils
	dev-lisp/split-sequence
	dev-lisp/usocket
"
