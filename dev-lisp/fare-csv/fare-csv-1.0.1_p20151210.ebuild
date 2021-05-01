# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="39fcada5db2899af172454899ff13a07c62ebdb9"

DESCRIPTION="Robust CSV parser and printer"
HOMEPAGE="https://github.com/fare/fare-csv"
SRC_URI="https://github.com/fare/fare-csv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
