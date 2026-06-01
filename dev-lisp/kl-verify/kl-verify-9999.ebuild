# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A library to generate simple verify code picture"
HOMEPAGE="https://github.com/kevinlynx/kl-verify"

EGIT_REPO_URI="https://github.com/kevinlynx/kl-verify.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/image"
