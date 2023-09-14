# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8fb82c492ac65a9c88f6fa91e46f07532d154f4"

DESCRIPTION="An implementation of the ring-buffer with the DWORD wrap-around trick"
HOMEPAGE="https://github.com/mateuszb/alien-ring"
SRC_URI="https://github.com/mateuszb/alien-ring/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-gray-streams
"
BDEPEND=""
