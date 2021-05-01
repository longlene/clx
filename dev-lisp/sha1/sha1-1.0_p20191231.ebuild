# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 git-r3

EGIT_COMMIT="a70480b06af25307d349d2c59a6b60a72b04dca5"

DESCRIPTION="SHA1 Digest and HMAC for Common Lisp"
HOMEPAGE="https://github.com/massung/sha1"
SRC_URI="https://github.com/massung/sha1/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/base64
"
