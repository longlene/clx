# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="The Nebula file server"
HOMEPAGE="http://metacircular.net/projects/nebula/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/kisom/cl-nebula.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/cl-who
dev-lisp/flexi-streams
dev-lisp/ironclad
dev-lisp/local-time
dev-lisp/log4cl
dev-lisp/postmodern
dev-lisp/restas
dev-lisp/st-json
dev-lisp/uuid
app-emacs/slime
"
