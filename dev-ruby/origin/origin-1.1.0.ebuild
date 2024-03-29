# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/origin/origin-1.1.0.ebuild,v 1.1 2013/05/10 06:47:02 graaff Exp $

EAPI=8

# does not support Ruby 1.8 syntax
USE_RUBY="ruby31 ruby32" #jruby

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

GITHUB_USER="mongoid"
GITHUB_PROJECT="${PN}"

MY_PV="${PV/_rc/.rc}"

inherit ruby-fakegem

DESCRIPTION="Origin is a simple DSL for generating MongoDB selectors and options"
HOMEPAGE="http://mongoid.org/"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/archive/v${MY_PV}.tar.gz -> ${GITHUB_PROJECT}-${MY_PV}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "
	test? (
		>=dev-ruby/activesupport-3.1 =dev-ruby/activesupport-3*
		>=dev-ruby/i18n-0.6:0.6
		>=dev-ruby/tzinfo-0.3.22
	)"
