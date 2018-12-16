# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fails your build if code quality thresholds are not met"
HOMEPAGE="http://github.com/square/cane"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/parallel-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/rspec-fire-0"

