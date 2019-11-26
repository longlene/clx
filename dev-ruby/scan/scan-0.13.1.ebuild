# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The easiest way to run tests of your iOS and Mac app"
HOMEPAGE="https://fastlane.tools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fastlane_core-0.52.1"
ruby_add_rdepend ">=dev-ruby/xcpretty-0.2.2"
ruby_add_rdepend ">=dev-ruby/xcpretty-travis-formatter-0.0.3"
ruby_add_rdepend ">=dev-ruby/slack-notifier-1.3"
ruby_add_rdepend ">=dev-ruby/terminal-table-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/fastlane-1.25.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.38.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0.2.3"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.4"
ruby_add_rdepend ">=dev-ruby/webmock-1.19.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"

