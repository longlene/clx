# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7f191be66b468987925718b3e236581ec2f1aa67"

DESCRIPTION=""
HOMEPAGE="https://github.com/bonkzwonil/cl-tgbot"
SRC_URI="https://github.com/bonkzwonil/cl-tgbot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/yason
	dev-lisp/cl-redis
	dev-lisp/cl-ppcre
"
