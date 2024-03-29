# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Basic Opinion Detector"
HOMEPAGE="http://opener-project.github.com/"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opener-daemons-2.2"
ruby_add_rdepend ">=dev-ruby/opener-webservice-2.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.2"
ruby_add_rdepend ">=dev-ruby/oga-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-2.0"

