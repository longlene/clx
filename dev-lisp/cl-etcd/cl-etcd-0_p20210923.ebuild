# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cd98e7803df34af0ec2b53a2da93016cef49920e"

DESCRIPTION="Run etcd as an asynchronous inferior process"
HOMEPAGE="https://github.com/atgreen/cl-etcd/"
SRC_URI="https://github.com/atgreen/cl-etcd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/async-process
	dev-lisp/bordeaux-threads
	dev-lisp/cl-base64
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/str
	dev-lisp/drakma
	dev-lisp/flexi-streams
	dev-lisp/split-sequence
"
BDEPEND=""
