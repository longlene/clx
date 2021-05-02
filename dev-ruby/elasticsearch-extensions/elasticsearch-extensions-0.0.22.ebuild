# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extensions for the Elasticsearch Rubygem"
HOMEPAGE=""

LICENSE="Apache 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ansi-0"
ruby_add_rdepend ">=dev-ruby/minitest-4.0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"
ruby_add_rdepend ">dev-ruby/bundler-1"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/shoulda-context-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/turn-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/ci_reporter-1.9"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-0"
ruby_add_rdepend ">=dev-ruby/cane-0"
ruby_add_rdepend ">=dev-ruby/patron-0"
ruby_add_rdepend ">=dev-ruby/oj-0"

