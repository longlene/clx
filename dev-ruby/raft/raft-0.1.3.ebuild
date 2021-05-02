# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple Raft distributed consensus implementation"
HOMEPAGE="http://github.com/harryw/raft"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/goliath-1.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3"
ruby_add_rdepend ">=dev-ruby/cucumber-1.0"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"

