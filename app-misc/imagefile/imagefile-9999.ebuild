# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="imagefile conversion tools"
HOMEPAGE="http://git.2f30.org/imagefile/"
SRC_URI=""

EGIT_REPO_URI="git://git.2f30.org/imagefile"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="media-libs/giflib"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX =/ s#/local##' config.mk
}
