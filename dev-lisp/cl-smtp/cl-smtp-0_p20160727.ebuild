# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="04d7278fbf06e0b7a6532ffb5e61927f1a24190e"

DESCRIPTION="A Common Lisp client library for the SMTP network protocol"
HOMEPAGE="http://common-lisp.net/project/cl-smtp/ http://www.cliki.net/CL-SMTP"
SRC_URI="https://github.com/deadtrickster/cl-smtp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/usocket
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-lisp/cl-base64
	dev-lisp/cl-plus-ssl
"

