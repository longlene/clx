# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4985647cc75e19b7604cf5afa74a27ace3f58893"

DESCRIPTION="S-XML-RPC is an implementation of XML-RPC in Common Lisp for both client and server"
HOMEPAGE="http://www.common-lisp.net/project/s-xml-rpc/"
SRC_URI="https://github.com/ibawt/s-xml-rpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/s-xml
"

