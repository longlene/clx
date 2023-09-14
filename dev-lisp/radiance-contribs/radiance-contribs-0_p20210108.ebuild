# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2038913552da6cb986d48b3507e1431867df9237"

DESCRIPTION="Standard implementations and drivers for the radiance interfaces"
HOMEPAGE="https://github.com/Shirakumo/radiance-contribs"
SRC_URI="https://github.com/Shirakumo/radiance-contribs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	dev-lisp/cl-json
	dev-lisp/closer-mop
	dev-lisp/lambdalite
	dev-lisp/trivial-ldap
	dev-lisp/babel
	dev-lisp/cl-base64
	dev-lisp/log4cl
	dev-lisp/postmodern
	dev-lisp/bordeaux-threads
	dev-lisp/cl-sendmail
	dev-lisp/cl-smtp
	dev-lisp/cffi
	dev-lisp/verbose
	dev-lisp/woo
	dev-lisp/http-body
"
BDEPEND=""
