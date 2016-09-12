# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="TOML parser in C"
HOMEPAGE="https://github.com/ajwans/libtoml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ajwans/libtoml.git"

LICENSE="as-is"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-utils/ragel"
RDEPEND="${DEPEND}"
