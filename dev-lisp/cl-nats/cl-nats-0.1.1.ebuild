# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="NATS client for Common Lisp"
HOMEPAGE="https://github.com/tormaroe/cl-nats"
SRC_URI="https://github.com/tormaroe/cl-nats/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/bordeaux-threads
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/rutils
"
