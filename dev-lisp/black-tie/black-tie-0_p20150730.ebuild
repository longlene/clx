# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d6ad148c96a93e508d5d14638b125de331d3feb"

DESCRIPTION="A noise library in Common Lisp"
HOMEPAGE="https://github.com/aerique/black-tie"
SRC_URI="https://github.com/aerique/black-tie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

