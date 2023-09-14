# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d7e236752aa291776c49c0bbe435a64dc1fbff78"

DESCRIPTION="Tracing profiler for Common Lisp"
HOMEPAGE="https://github.com/TeMPOraL/tracer"
SRC_URI="https://github.com/TeMPOraL/tracer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
"
BDEPEND=""
