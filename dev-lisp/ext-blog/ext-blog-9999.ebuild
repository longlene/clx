# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A BLOG engine which supports custom theme"
HOMEPAGE="https://github.com/kevinlynx/ext-blog"

EGIT_REPO_URI="https://github.com/kevinlynx/ext-blog.git"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/restas
dev-lisp/cl-store
dev-lisp/cl-closure-template
dev-lisp/local-time
dev-lisp/kl-verify
dev-lisp/image
dev-lisp/file-publisher
dev-lisp/s-xml-rpc
dev-lisp/cl-fad"
