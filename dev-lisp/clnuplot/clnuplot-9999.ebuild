# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Common Lisp interface to GNUPlot"
HOMEPAGE="https://github.com/gwkkwg/clnuplot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gwkkwg/clnuplot.git"

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

