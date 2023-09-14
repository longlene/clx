# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e60c37096f956eb14dd91bf653e33db77a0fb715"

DESCRIPTION="RailsOnLisp app server"
HOMEPAGE="https://github.com/RailsOnLisp/rol-server"
SRC_URI="https://github.com/RailsOnLisp/rol-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3bmd
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cfg
	dev-lisp/cl-base64
	dev-lisp/cl-debug
	dev-lisp/cl-smtp
	dev-lisp/ironclad
	dev-lisp/local-time
	dev-lisp/facts
	dev-lisp/flexi-streams
	dev-lisp/random-streams
	dev-lisp/re
	dev-lisp/rol-assets
	dev-lisp/rol-files
	dev-lisp/rol-log
	dev-lisp/rol-template
	dev-lisp/rol-uri
	dev-lisp/cl-str
	dev-lisp/trivial-backtrace
	dev-lisp/trivial-utf8
	dev-lisp/cl-inflector
	dev-lisp/hunchentoot
"
BDEPEND=""
