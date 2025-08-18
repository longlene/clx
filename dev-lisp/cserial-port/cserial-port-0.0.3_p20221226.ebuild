# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dac2a1cfea14e9d5e13521b06f6e78c3783cee09"

DESCRIPTION="Serial-port accessing library for Common Lisp"
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
