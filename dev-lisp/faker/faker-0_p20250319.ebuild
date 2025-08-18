# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9a6751f480a421dddcd42f2e18e8b6149834e764"

DESCRIPTION="Faker is a Common Lisp system that generates fake data for you"
HOMEPAGE="https://github.com/Junker/faker"
SRC_URI="https://github.com/Junker/faker/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/alexandria
	dev-lisp/cl-slug
	dev-lisp/random-ua
"
BDEPEND=""
