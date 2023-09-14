# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8dfae16d106ad5f1f33c4f0b038f88bf54735198"

DESCRIPTION="RailsOnLisp logging facility"
HOMEPAGE="https://github.com/RailsOnLisp/rol-log"
SRC_URI="https://github.com/RailsOnLisp/rol-log/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
