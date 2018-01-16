# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Framework for building and distributing games using Gosu"
HOMEPAGE="http://shawn42.github.com/gamebox"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gosu-0"
ruby_add_rdepend ">=dev-ruby/publisher-0"
ruby_add_rdepend ">=dev-ruby/conject-0.0.8"
ruby_add_rdepend ">=dev-ruby/tween-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/require_all-0"
ruby_add_rdepend ">=dev-ruby/kvo-0.1.0"
ruby_add_rdepend ">=dev-ruby/listen-2.4.0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.7"
ruby_add_rdepend ">=dev-ruby/pry-remote-0"
ruby_add_rdepend ">=dev-ruby/rspec-core-2.13.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-2.13.0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-2.13.0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/polaris-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/chipmunk-0"

