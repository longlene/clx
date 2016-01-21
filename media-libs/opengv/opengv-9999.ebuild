# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="A collection of compute vision methods for solving geometric vision problems"
HOMEPAGE="http://laurentkneip.github.io/opengv/page_installation.html"
SRC_URI=""

EGIT_REPO_URI="https://github.com/laurentkneip/opengv.git"

LICENSE="as-is"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
