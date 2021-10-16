# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake git-r3

DESCRIPTION="Bloom filters for C++11"
HOMEPAGE="http://mavam.github.io/libbf"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mavam/libbf.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
