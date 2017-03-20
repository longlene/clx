# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="lolcat.gemspec"

inherit ruby-fakegem

DESCRIPTION="Rainbows and unicorns!"
HOMEPAGE="https://github.com/busyloop/lolcat"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-vcs/git"

ruby_add_rdepend ">=dev-ruby/trollop-1.16.2-r3:0
	dev-ruby/paint"

all_ruby_prepare() {
	sed -i '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC}
}
