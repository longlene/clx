# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Squib is a Ruby DSL for prototyping card games"
HOMEPAGE="https://github.com/andymeneely/squib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cairo-1.14.0"
ruby_add_rdepend ">=dev-ruby/pango-2.2.0"
ruby_add_rdepend ">=dev-ruby/roo-2.0.0"
ruby_add_rdepend ">=dev-ruby/rsvg2-2.2.0"
ruby_add_rdepend ">=dev-ruby/mercenary-0.3.4"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-1.6"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.1"
ruby_add_rdepend ">=dev-ruby/github-markup-1.3"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/game_icons-0"

