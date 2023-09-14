# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="347c037275d9af90f57a3224b72be5781c444522"

DESCRIPTION="Set data structure for use with bordeaux-threads"
HOMEPAGE="https://github.com/RailsOnLisp/bordeaux-set"
SRC_URI="https://github.com/RailsOnLisp/bordeaux-set/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""
