# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit npm

DESCRIPTION="A package manager for the web"
HOMEPAGE="http://bower.io"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/abbrev
dev-nodejs/archy
dev-nodejs/bower-config
dev-nodejs/bower-endpoint-parser
dev-nodejs/bower-json
dev-nodejs/bower-logger
dev-nodejs/bower-registry-client
dev-nodejs/cardinal
dev-nodejs/chalk
dev-nodejs/chmodr
dev-nodejs/decompress-zip
dev-nodejs/fstream
dev-nodejs/fstream-ignore
dev-nodejs/glob
dev-nodejs/graceful-fs
dev-nodejs/handlebars
dev-nodejs/inquirer
dev-nodejs/insight
dev-nodejs/is-root
dev-nodejs/junk
dev-nodejs/lockfile
dev-nodejs/lru-cache
dev-nodejs/mkdirp
dev-nodejs/mout
dev-nodejs/nopt
dev-nodejs/opn
dev-nodejs/osenv
dev-nodejs/p-throttler
dev-nodejs/promptly
dev-nodejs/q
dev-nodejs/request
dev-nodejs/request-progress
dev-nodejs/retry
dev-nodejs/rimraf
dev-nodejs/semver
dev-nodejs/shell-quote
dev-nodejs/stringify-object
dev-nodejs/tar-fs
dev-nodejs/tmp
dev-nodejs/update-notifier
dev-nodejs/which
"

