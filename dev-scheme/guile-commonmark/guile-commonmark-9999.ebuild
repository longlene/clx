# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 autotools

DESCRIPTION="Implementation of commonmark for Guile"
HOMEPAGE="https://github.com/OrangeShark/guile-commonmark"
SRC_URI=""

EGIT_REPO_URI="https://github.com/OrangeShark/guile-commonmark.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
