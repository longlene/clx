# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f3ec0326262c7bc5435e9ba4f0b0d808c46e844"

DESCRIPTION="Common Lisp library for communicating with Jira API"
HOMEPAGE="https://github.com/rlevins/cl-jira"
SRC_URI="https://github.com/rlevins/cl-jira/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/log4cl
"
BDEPEND=""
