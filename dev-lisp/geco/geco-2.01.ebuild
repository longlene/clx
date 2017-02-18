# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Genetic Evolution through Combination of Objects"
HOMEPAGE="https://common-lisp.net/project/geco/"
SRC_URI="https://common-lisp.net/project/geco/download/${P}a.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
