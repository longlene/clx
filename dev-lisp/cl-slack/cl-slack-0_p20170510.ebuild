# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="019ecb3e9a1605a8671fab85b4e564a257f76a04"

DESCRIPTION="Slack API from cl"
HOMEPAGE="https://github.com/m0cchi/cl-slack"
SRC_URI="https://github.com/m0cchi/cl-slack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
"
