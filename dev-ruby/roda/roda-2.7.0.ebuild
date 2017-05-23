# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Routing tree web framework toolkit"
HOMEPAGE="http://roda.jeremyevans.net/"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
