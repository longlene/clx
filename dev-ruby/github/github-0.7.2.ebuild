# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The official \`github\` command line helper for simplifying your GitHub experience"
HOMEPAGE="https://github.com/defunkt/github-gem"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/text-hyphen-1.0.0"
ruby_add_rdepend "=dev-ruby/text-format-1.0.0"
ruby_add_rdepend ">=dev-ruby/highline-1.6"
ruby_add_rdepend ">=dev-ruby/json_pure-1.5.1"
ruby_add_rdepend ">=dev-ruby/launchy-2.0.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.1"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0.0"

