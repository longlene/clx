# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Markov chains for all your friends~"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-0"
ruby_add_rdepend ">=dev-ruby/memory_profiler-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend "=dev-ruby/twitter-5.14"
ruby_add_rdepend ">=dev-ruby/rufus-scheduler-0"
ruby_add_rdepend ">=dev-ruby/gingerice-0"
ruby_add_rdepend ">=dev-ruby/htmlentities-0"
ruby_add_rdepend ">=dev-ruby/engtagger-0"
ruby_add_rdepend ">=dev-ruby/fast-stemmer-0"
ruby_add_rdepend ">=dev-ruby/highscore-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/oauth-0"

