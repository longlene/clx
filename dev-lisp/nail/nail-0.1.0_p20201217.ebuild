# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="77ce816968bf374d07a86d7a3c6d9f3e566867c7"

DESCRIPTION="User configurable logger for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/nail"
SRC_URI="https://github.com/fukamachi/nail/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	dev-lisp/xsubseq
	dev-lisp/dissect
"
BDEPEND=""
