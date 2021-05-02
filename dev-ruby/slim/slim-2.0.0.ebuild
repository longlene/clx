# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rake"
RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

inherit ruby-fakegem

DESCRIPTION="Template language whose goal is reduce the syntax to the essential parts without becoming cryptic."
HOMEPAGE="https://github.com/slim-template/slim"
SRC_URI="https://github.com/slim-template/slim/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/temple-0.6.5
	>=dev-ruby/tilt-1.3.3"
ruby_add_bdepend "test? (
		dev-ruby/sinatra
		dev-ruby/wikicloth
		dev-ruby/rails
		virtual/ruby-minitest
		dev-ruby/actionpack
		dev-ruby/activemodel
		)
	doc? ( dev-ruby/yard )"

RESTRICT="test"
# requires
# .. wikicloth, creole .. shouldn't they be deps of tilt?
# .. asciidoc .. shouldn't this be a dep of temple or tilt?
# .. that sinatra has slim_test.rb installed (patched out, but still)

RUBY_PATCHES=( ${PV}-remove-bundler-and-sinatra.patch )

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
