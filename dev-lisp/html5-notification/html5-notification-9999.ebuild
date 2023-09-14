# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp library for handling EventSource HTML5 notifications"
HOMEPAGE="https://github.com/lokedhs/html5-notification"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lokedhs/html5-notification.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/hunchentoot
	dev-lisp/split-sequence
	dev-lisp/st-json
	dev-lisp/flexi-streams
	dev-lisp/alexandria
	dev-lisp/log4cl
"
