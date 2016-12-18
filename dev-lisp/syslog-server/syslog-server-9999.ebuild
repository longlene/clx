# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An implementation of the syslog protocol that pretty prints the logs received and saves them in an sqlite db"
HOMEPAGE="https://github.com/fiddlerwoaroof/syslog-server"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fiddlerwoaroof/syslog-server.git"

LICENSE="MPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-ansi-term
	dev-lisp/cl-dbi
	dev-lisp/fwoar_lispuitils
	dev-lisp/net_didierverna_clon
	dev-lisp/osicat
	dev-lisp/positional-lambda
	dev-lisp/serapeum
	dev-lisp/smug
	dev-lisp/usocket
	app-emacs/slime
"
