# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-2

DESCRIPTION="An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C compliant JSON parser"
HOMEPAGE="https://github.com/pohuguet/cJSON http://sourceforge.net/projects/cjson/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pohuguet/cJSON.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
