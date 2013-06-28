# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="A Common Lisp library for interacting with MS SQL databases"
HOMEPAGE="http://code.google.com/p/cl-mssql/"
SRC_URI="https://cl-mssql.googlecode.com/files/cl-mssql-${PV}.tar.bz2"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-db/freetds
dev-lisp/cffi
dev-lisp/iterate
dev-lisp/garbage-pools
dev-lisp/parse-number"

