# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A BLOG engine which supports custom theme"
HOMEPAGE="https://github.com/kevinlynx/ext-blog"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kevinlynx/ext-blog.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/asdf
"

