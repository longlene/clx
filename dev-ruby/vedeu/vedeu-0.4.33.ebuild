# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A GUI framework written in Ruby for building terminal/console applications"
HOMEPAGE="https://github.com/gavinlaking/vedeu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.8"
ruby_add_rdepend "=dev-ruby/guard-2.12.6"
ruby_add_rdepend "=dev-ruby/guard-bundler-2.1.0"
ruby_add_rdepend "=dev-ruby/guard-minitest-2.4.4"
ruby_add_rdepend "=dev-ruby/inch-0.6.2"
ruby_add_rdepend "=dev-ruby/minitest-5.7.0"
ruby_add_rdepend "=dev-ruby/minitest-reporters-1.0.17"
ruby_add_rdepend "=dev-ruby/mocha-1.1.0"
ruby_add_rdepend "=dev-ruby/pry-0.10.1"
ruby_add_rdepend "=dev-ruby/pry-byebug-3.1.0"
ruby_add_rdepend "=dev-ruby/rake-10.4.2"
ruby_add_rdepend "=dev-ruby/rubocop-0.32.0"
ruby_add_rdepend "=dev-ruby/ruby-prof-0.15.8"
ruby_add_rdepend "=dev-ruby/simplecov-0.10.0"
ruby_add_rdepend "=dev-ruby/simplecov-console-0.2.0"
ruby_add_rdepend "=dev-ruby/yard-0.8.7.6"

