# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9586a39dc4e88cf38471763d3c3c3576475c4816"

DESCRIPTION="Common Lisp Huffman coding library"
HOMEPAGE="https://github.com/sile/huffman"
SRC_URI="https://github.com/sile/huffman/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bitop
"
