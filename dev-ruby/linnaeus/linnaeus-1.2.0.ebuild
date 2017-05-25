# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Linnaeus provides a redis-backed Bayesian classifier"
HOMEPAGE="http://github.com/djcp/linnaeus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.0.0"
ruby_add_rdepend ">=dev-ruby/stemmer-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/yard-0.7"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/jeweler-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
