# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="rspec-expectations provides a simple, readable API to express expected outcomes of a code example"
HOMEPAGE="http://github.com/rspec/rspec-expectations"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-support-3.1.0"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.2.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3"
ruby_add_rdepend ">=dev-ruby/aruba-0.5"
ruby_add_rdepend ">=dev-ruby/minitest-5.2"

