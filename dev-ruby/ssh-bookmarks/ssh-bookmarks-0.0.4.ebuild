# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/AndreyAntipov/ssh-bookmarks"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/inch-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/hirb-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/factory_girl-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/reek-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-0"
ruby_add_rdepend ">=dev-ruby/fuubar-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-inch-0"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-0"
ruby_add_rdepend ">=dev-ruby/guard-yard-0"
ruby_add_rdepend ">=dev-ruby/guard-reek-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/guard-cucumber-0"
ruby_add_rdepend ">=dev-ruby/guard-bundler-0"

