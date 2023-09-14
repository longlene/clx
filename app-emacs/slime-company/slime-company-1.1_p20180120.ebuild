# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp vcs-snapshot

EGIT_COMMIT="4c2e2805540dea700130607fa235018a87e4a070"

DESCRIPTION="Company-mode completion backend for Slime"
HOMEPAGE="https://github.com/anwyn/slime-company"
SRC_URI="https://github.com/anwyn/slime-company/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-emacs/company-mode
	dev-lisp/slime
"
RDEPEND="${DEPEND}"
