# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-3 git-2


DESCRIPTION="A Common Lisp client library for the SMTP network protocol."
HOMEPAGE="http://common-lisp.net/project/cl-smtp/
		http://www.cliki.net/CL-SMTP"
SRC_URI=""

EGIT_REPO_URI="git@github.com:ury-marshak/cl-smtp.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/cl-base64
		dev-lisp/usocket
		dev-lisp/trivial-gray-streams
		dev-lisp/flexi-streams
		dev-lisp/cl-plus-ssl"

