# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Straight port of linenoise to Common Lisp"
HOMEPAGE="https://github.com/jasom/clinenoise"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jasom/clinenoise.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/alexandria
dev-lisp/split-sequence
"
