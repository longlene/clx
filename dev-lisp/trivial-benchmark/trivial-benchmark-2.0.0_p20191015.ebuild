# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="42d76733dd2e873471c6f1e27d39113293f7dd5c"

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
