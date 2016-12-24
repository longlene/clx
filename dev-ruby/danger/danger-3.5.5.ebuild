# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Stop Saying 'You Forgot To…' in Code Review"
HOMEPAGE="https://github.com/danger/danger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/claide-1.0"
ruby_add_rdepend ">=dev-ruby/claide-plugins-0.9.2"
ruby_add_rdepend ">=dev-ruby/git-1"
ruby_add_rdepend ">=dev-ruby/colored-1.2"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/faraday-http-cache-1.0"
ruby_add_rdepend ">=dev-ruby/octokit-4.2"
ruby_add_rdepend ">=dev-ruby/kramdown-1.5"
ruby_add_rdepend ">=dev-ruby/terminal-table-1"
ruby_add_rdepend ">=dev-ruby/cork-0.1"
ruby_add_rdepend ">=dev-ruby/gitlab-3.7.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0.2"
ruby_add_rdepend ">=dev-ruby/webmock-2.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.44"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend "=dev-ruby/listen-3.0.7"
ruby_add_rdepend ">=dev-ruby/guard-2.14"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.7"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-1.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0.12.0"

