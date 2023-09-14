# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5860cdf133ac0d04bffcae37403ac39c0b056fed"

DESCRIPTION="C-style escape directives for Common Lisp"
HOMEPAGE="https://github.com/williamyaoh/trivial-escapes/"
SRC_URI="https://github.com/williamyaoh/trivial-escapes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
