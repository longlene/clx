# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="45143f0299e7239461dca43bc870af2bfeb091fe"

DESCRIPTION="Prometheus.io Common Lisp client"
HOMEPAGE="https://github.com/deadtrickster/prometheus.cl"
SRC_URI="https://github.com/deadtrickster/prometheus.cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/quantile-estimator
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/cffi
	dev-lisp/hunchentoot
	dev-lisp/trivial-utf8
	dev-lisp/salza2
	test? ( dev-lisp/prove
			dev-lisp/log4cl
			dev-lisp/mw-equiv
			dev-lisp/cl-interpol
			dev-lisp/drakma
			dev-lisp/chipz
			dev-lisp/cl-coveralls
		)

"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.all.asd ${PN}.test.asd ${PN}.test.support.asd ${PN}.pushgateway.test.asd ${PN}.formats.text.test.asd ${PN}.exposers.hunchentoot.test.asd ${PN}.collectors.sbcl.test.asd ${PN}.collectors.process.test.asd t
	use example || rm -r ${PN}.examples.asd examples
}
