# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="JSON to CSV conversion tool with user friendly CLI"
HOMEPAGE="https://github.com/korczis/json2csv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gli-2.11"
ruby_add_rdepend ">=dev-ruby/json_pure-1.8.1"
ruby_add_rdepend ">=dev-ruby/multi_json-1.10.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/coveralls-0.7"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.24"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8"

