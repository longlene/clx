# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ab43ed4d9bdc5267fc25a83fdc610391654c664"

DESCRIPTION="A Common Lisp client library for the SMTP network protocol"
HOMEPAGE="http://common-lisp.net/project/cl-smtp/
		http://www.cliki.net/CL-SMTP"
SRC_URI="https://github.com/ury-marshak/cl-smtp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/cl-base64
	dev-lisp/usocket
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-lisp/cl-plus-ssl
"

