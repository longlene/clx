# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="70dd4227b7351ccabaae965ebb79a6c12f689ae0"

DESCRIPTION="A frontend of morphological analyzer Igo"
HOMEPAGE="https://github.com/masatoi/cl-igo"
SRC_URI="https://github.com/masatoi/cl-igo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/charseq
"
