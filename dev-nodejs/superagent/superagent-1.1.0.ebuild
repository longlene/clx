# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="elegant & feature rich browser/node HTTP with a fluent API"
HOMEPAGE="https://github.com/visionmedia/superagent"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/qs
dev-nodejs/formidable
dev-nodejs/mime
dev-nodejs/conmponent-emitter
dev-nodejs/methods
dev-nodejs/cookiejar
dev-nodejs/debug
dev-nodejs/reduce-component
dev-nodejs/extend
dev-nodejs/form-data
dev-nodejs/readable-stream
"
