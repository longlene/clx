# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c3dbc8e38dbfd84c5bb5292cf165f3a7a0a5cf4b"

DESCRIPTION="serial-port accessing library for Common Lisp"
HOMEPAGE="https://github.com/snmsts/cserial-port"
SRC_URI="https://github.com/snmsts/cserial-port/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-gray-streams
	dev-lisp/osicat
"
