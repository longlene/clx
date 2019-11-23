# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RubyCritic is a tool that wraps around various static analysis gems to provide a quality report of your Ruby code"
HOMEPAGE="https://github.com/whitesmith/rubycritic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/virtus-1.0"
ruby_add_rdepend "=dev-ruby/flay-2.8.0"
ruby_add_rdepend "=dev-ruby/flog-4.4.0"
ruby_add_rdepend "=dev-ruby/reek-4.1.0"
ruby_add_rdepend "=dev-ruby/parser-2.3.1.2"
ruby_add_rdepend ">=dev-ruby/ruby_parser-3.8"
ruby_add_rdepend ">=dev-ruby/colorize-0"
ruby_add_rdepend "=dev-ruby/launchy-2.4.3"
ruby_add_rdepend ">=dev-ruby/aruba-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.3"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"
ruby_add_rdepend ">=dev-ruby/rubocop-0.41.1"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"

