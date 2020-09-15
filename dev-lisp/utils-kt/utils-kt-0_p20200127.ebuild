# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4adfe2889036ab5ffdd3cc2182ca2cc692bf11ff"

DESCRIPTION="Low-level utilities used by all of Kenny's projects"
HOMEPAGE="https://github.com/kennytilton/utils-kt"
SRC_URI="https://github.com/kennytilton/utils-kt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
