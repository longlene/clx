# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="410e5579c31d6fbc4e6df794265d506d92ad356b"

DESCRIPTION="ZLIB library"
HOMEPAGE="https://github.com/sharplispers/zlib"
SRC_URI="https://github.com/sharplispers/zlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
