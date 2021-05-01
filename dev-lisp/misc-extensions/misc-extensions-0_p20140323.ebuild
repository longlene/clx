# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="461e9b8ec583661be215969ae90ccbd4f3159746"

DESCRIPTION="Some utilities that are used by FSet and also are useful in conjunction with FSet"
HOMEPAGE="https://github.com/slburson/misc-extensions"
SRC_URI="https://github.com/slburson/misc-extensions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
