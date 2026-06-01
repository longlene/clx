# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="package name alias"
HOMEPAGE="https://github.com/pve1/package-alias"

EGIT_REPO_URI="git@github.com:pve1/package-alias.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
