# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake git-r3

DESCRIPTION="C++ binding for libzdb"
HOMEPAGE="https://github.com/mverbert/libzdbmm"

EGIT_REPO_URI="https://github.com/longlene/libzdbmm.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="dev-db/libzdb"
RDEPEND="${DEPEND}"
