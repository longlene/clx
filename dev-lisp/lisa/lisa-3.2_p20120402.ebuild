# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53c4f7884a24cd06e135c2aea5f1392dc58745cd"

DESCRIPTION="A Common Lisp production-rule system"
HOMEPAGE="http://lisa.sourceforge.net"
SRC_URI="https://github.com/johanlindberg/lisa/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
