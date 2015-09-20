# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Read the progress of a stream"
HOMEPAGE="https://github.com/freeall/progress-stream"
#SRC_URI=""

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/single-line-log
dev-nodejs/speedometer
dev-nodejs/through2
"
