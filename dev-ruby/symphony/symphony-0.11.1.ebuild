# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Symphony is a subscription-based asynchronous job system"
HOMEPAGE="http://bitbucket.org/ged/symphony"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/configurability-3.1"
ruby_add_rdepend ">=dev-ruby/loggability-0.11"
ruby_add_rdepend ">=dev-ruby/pluggability-0.4"
ruby_add_rdepend ">=dev-ruby/bunny-2.0"
ruby_add_rdepend ">=dev-ruby/sysexits-1.1"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.3"
ruby_add_rdepend ">=dev-ruby/msgpack-1.0"
ruby_add_rdepend ">=dev-ruby/metriks-0.9"
ruby_add_rdepend ">=dev-ruby/rusage-0.2"
ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4"
ruby_add_rdepend ">=dev-ruby/hoe-deveiate-0.6"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8"
ruby_add_rdepend ">=dev-ruby/timecop-0.8"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.15"

