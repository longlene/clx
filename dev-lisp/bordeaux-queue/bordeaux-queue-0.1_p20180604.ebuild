# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66c3a546c6e807229d4809048a2d834c0ade6de4"

DESCRIPTION="Re-entrant queue using bordeaux-threads"
HOMEPAGE="https://github.com/RailsOnLisp/bordeaux-queue"
SRC_URI="https://github.com/RailsOnLisp/bordeaux-queue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""
