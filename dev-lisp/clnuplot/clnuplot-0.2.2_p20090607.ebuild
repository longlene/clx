# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="979237d33be155bb802f16723e500b2c7dfa20a4"

DESCRIPTION="Common Lisp interface to GNUPlot"
HOMEPAGE="https://github.com/gwkkwg/clnuplot"
SRC_URI="https://github.com/gwkkwg/clnuplot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-containers
	dev-lisp/cl-mathstats
	dev-lisp/metabang-bind
	dev-lisp/trivial-shell
	sci-visualization/gnuplot"

