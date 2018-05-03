# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ad86d46c4859334765e42dccbab67b5239dc9091"

DESCRIPTION="Drop in replacement for cl-arrows with some bonus features"
HOMEPAGE="https://github.com/eschulte/cl-arrowz"
SRC_URI="https://github.com/eschulte/cl-arrowz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
