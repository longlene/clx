# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="718c761e33749e297cd2809c7ba3ade1985c49f7"

DESCRIPTION="xcessive macro that generates decision trees for small sets of strings"
HOMEPAGE="https://github.com/pkhuong/string-case"
SRC_URI="https://github.com/pkhuong/string-case/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
