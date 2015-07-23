# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Extremely fast HTTP Archive \(HAR\) validator using JSON Schema"
HOMEPAGE="https://github.com/ahmadnassri/har-validator"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/is-my-json-valid
dev-nodejs/commander
dev-nodejs/chalk
dev-nodejs/bluebird
"
