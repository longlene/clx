# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 git-2

DESCRIPTION="A Common Lisp library for sending email."
HOMEPAGE="http://www.cliki.net/cl-mime/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Publitechs/cl-sendmail.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-sendmail
dev-lisp/cl-mime
dev-lisp/cl-base64
dev-lisp/xmls
dev-lisp/xmls-tools
dev-lisp/sbcl"

