# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="446b8e27327750f0573c9922ba905a14013681a2"

DESCRIPTION="A lisp port of the Box2D physics engine"
HOMEPAGE="https://github.com/Ralith/blox2d"
SRC_URI="https://github.com/Ralith/blox2d/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
