# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Cat detection"
HOMEPAGE="https://github.com/harthur/kittydar"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/svm
dev-nodejs/hog-descriptor
dev-nodejs/brain
dev-nodejs/canvas
"
