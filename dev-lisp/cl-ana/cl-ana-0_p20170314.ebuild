# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1d574c658a7ace855b0751665fb1e9a0385ed472"

DESCRIPTION="Common Lisp data analysis library with emphasis on modularity and conceptual clarity"
HOMEPAGE="https://github.com/ghollisjr/cl-ana"
SRC_URI="https://github.com/ghollisjr/cl-ana/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/antik
	dev-lisp/iterate
	dev-lisp/alexandira
	dev-lisp/cl-csv
	dev-lisp/external-program
	dev-lisp/split-sequence
	dev-lisp/gsll
	sci-visualization/gnuplot
	dev-lisp/cffi
	sci-libs/gsl
	sci-libs/hdf5
	media-gfx/graphviz
	dev-lisp/cl-fad
"
