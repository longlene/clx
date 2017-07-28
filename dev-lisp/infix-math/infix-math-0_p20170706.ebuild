# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5155ae9709e518061ace79887d78f8e79c61cac"

DESCRIPTION="An extensible infix syntax for math in Common Lisp"
HOMEPAGE="https://github.com/ruricolist/infix-math/"
SRC_URI="https://github.com/ruricolist/infix-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
