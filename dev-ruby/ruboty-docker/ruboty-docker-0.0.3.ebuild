# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Management Docker via Ruboty ChatOps"
HOMEPAGE="https://github.com/zchee/ruboty-docker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/docker-api-1.21"
ruby_add_rdepend ">=dev-ruby/ruboty-1.2"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.6"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0.10"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-0.2"

