# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6ebbdc15afd8f32cf5a473e1049e9343b4aecf88"

DESCRIPTION="Graph Drawing DSL (or Graphviz Interface) for Common Lisp"
HOMEPAGE="https://github.com/tkych/donuts"
SRC_URI="https://github.com/tkych/donuts/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/trivial-shell
"
