# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_COMMIT="2a0e2c73218ff6b325d783264813a44a1681eb1c"

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Tiny Common Lisp library to do some quick benchmark tests"
HOMEPAGE="http://shinmera.github.io/trivial-benchmark/"
SRC_URI="https://github.com/Shinmera/trivial-benchmark/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
