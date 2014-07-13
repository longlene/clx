# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"
inherit ruby-fakegem

DESCRIPTION="Git Library for Ruby"
HOMEPAGE="http://github.com/schacon/ruby-git/"
SRC_URI="http://gems.rubyforge.org/gems/git-${PV}.gem -> ruby-git-${PV}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="dev-util/git"
DEPEND="${RDEPEND}"


