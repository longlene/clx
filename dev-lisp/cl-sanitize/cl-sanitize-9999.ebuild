# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2
DESCRIPTION="cl-sanitize is a whitelist-based HTML sanitizer."
HOMEPAGE="https://github.com/archimag/cl-sanitize"
SRC_URI=""

EGIT_REPO_URI="git://github.com/archimag/cl-sanitize.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-libxml2"

