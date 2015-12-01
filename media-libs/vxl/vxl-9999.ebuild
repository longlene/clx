# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

#inherit versionator cmake-utils
inherit cmake-utils git-2

DESCRIPTION=""
HOMEPAGE=""
#SRC_URI="mirror://sourceforge/project/${PN}/${PN}/$(get_version_component_range 1-2)/${P}.tar.gz"

EGIT_REPO_URI="git://git.code.sf.net/p/vxl/git vxl-git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
