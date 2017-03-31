# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library is a Ruby interface to WordNet®[http://wordnet"
HOMEPAGE="http://deveiate.org/projects/Ruby-WordNet"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequel-4.38"
ruby_add_rdepend ">=dev-ruby/loggability-0.11"
ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4"
ruby_add_rdepend ">=dev-ruby/hoe-deveiate-0.8"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.2"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/simplecov-0.12"
ruby_add_rdepend ">=dev-ruby/hoe-3.15"

