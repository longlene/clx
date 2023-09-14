# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="310792ff8101c67edf9419f57199d6676e4d1e3a"

DESCRIPTION="CLOS-based wrapper builder for Web APIs"
HOMEPAGE="https://github.com/fukamachi/webapi"
SRC_URI="https://github.com/fukamachi/webapi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
