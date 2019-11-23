# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby-based microframework for robotics"
HOMEPAGE="https://github.com/hybridgroup/artoo"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.16.0"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.16.0"
ruby_add_rdepend ">=dev-ruby/http-0.6.1"
ruby_add_rdepend ">=dev-ruby/reel-0.5.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.10.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19.1"
ruby_add_rdepend "=dev-ruby/robeaux-0.4.1"

