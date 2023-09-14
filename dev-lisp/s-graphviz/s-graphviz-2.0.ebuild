# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="a s-expression presentation of GraphViz DOT Language"
HOMEPAGE="https://github.com/jingtaozf/s-graphviz/"
SRC_URI="https://github.com/jingtaozf/s-graphviz/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
"
BDEPEND=""
