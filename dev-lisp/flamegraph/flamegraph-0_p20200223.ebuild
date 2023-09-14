# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="50eca3731a9f3b358afaade1b0736a7e82f2061c"

DESCRIPTION="Flamegraphs for Common Lisp"
HOMEPAGE="https://github.com/40ants/cl-flamegraph"
SRC_URI="https://github.com/40ants/cl-flamegraph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
