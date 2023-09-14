# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ddd2f898a0fa35a2417302b27170517e24c806bd"

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
