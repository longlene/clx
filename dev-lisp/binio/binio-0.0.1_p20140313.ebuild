# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="092375a47e6f6b87372f751105583fa1988c7b4c"

DESCRIPTION="Common Lisp Binary I/O Library"
HOMEPAGE="https://github.com/sile/binio"
SRC_URI="https://github.com/sile/binio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
