# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc7f54b3a9b901d5648d7e9de358e29d3b794c78"

DESCRIPTION="A Common Lisp production-rule system"
HOMEPAGE="http://lisa.sourceforge.net"
SRC_URI="https://github.com/gpwwjr/lisa/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
