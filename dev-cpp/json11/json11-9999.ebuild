# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="A tiny JSON library for C++11"
HOMEPAGE="https://github.com/dropbox/json11"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dropbox/json11.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
