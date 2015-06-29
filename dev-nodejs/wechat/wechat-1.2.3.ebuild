# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit npm

DESCRIPTION="Wechat is a middleware and SDK of Wechat Official Account Admin Platform"
HOMEPAGE="https://github.com/node-webot/wechat"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xml2js
dev-nodejs/ejs
dev-nodejs/wechat-api
dev-nodejs/wechat-oauth
dev-nodejs/wechat-crypto
"

