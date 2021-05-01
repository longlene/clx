# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4b6a35b4931362621b0062be4940422f8c8f32c5"

DESCRIPTION="Lisp Roguelike Project"
HOMEPAGE="https://gitlab.com/serenitty/lrp"
SRC_URI="https://gitlab.com/serenitty/lrp/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/gamebox-math
	dev-lisp/uuid
"
