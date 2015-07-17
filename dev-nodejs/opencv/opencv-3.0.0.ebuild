# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Node Bindings to OpenCV"
HOMEPAGE="https://github.com/peterbraden/node-opencv"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=">=media-libs/opencv-2.3.1"
RDEPEND="${DEPEND}
dev-nodejs/nan
dev-nodejs/buffers
dev-nodejs/node-pre-gyp
"
