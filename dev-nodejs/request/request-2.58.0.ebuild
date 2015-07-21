# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Simplified HTTP request client"
HOMEPAGE="https://github.com/request/request"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/har-validator
dev-nodejs/isstream
dev-nodejs/combined-stream
dev-nodejs/stringstream
dev-nodejs/aws-sign2
dev-nodejs/hawk
dev-nodejs/oauth-sign
dev-nodejs/http-signature
dev-nodejs/tough-cookie
dev-nodejs/tunnel-agent
dev-nodejs/qs
dev-nodejs/node-uuid
dev-nodejs/mime-types
dev-nodejs/json-stringify-safe
dev-nodejs/form-data
dev-nodejs/forever-agent
dev-nodejs/extend
dev-nodejs/caseless
dev-nodejs/bl
"
