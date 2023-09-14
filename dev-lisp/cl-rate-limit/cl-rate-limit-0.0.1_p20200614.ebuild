# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="f46c1a991bd7ce18e6bc764bbaaa0499c601dba6"

DESCRIPTION="A library for limiting the rate"
HOMEPAGE="https://github.com/K1D77A/cl-rate-limit/"
SRC_URI="https://github.com/K1D77A/cl-rate-limit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
"
BDEPEND=""
