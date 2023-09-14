# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="GZIP-STREAM provides a few utilities for reading and writing streams in the gzip format"
HOMEPAGE="http://common-lisp.net/project/gzip-stream/"
SRC_URI="https://mydebian.googlecode.com/files/gzip-stream-0.2.8.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/salza2
dev-lisp/flexi-streams
dev-lisp/trivial-gray-streams"

