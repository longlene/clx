# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for Apache Spark"
HOMEPAGE="https://github.com/ondra-m/ruby-spark"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sourcify-0.6.0"
ruby_add_rdepend ">=dev-ruby/method_source-0"
ruby_add_rdepend ">=dev-ruby/commander-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/nio4r-0"
ruby_add_rdepend ">=dev-ruby/distribution-0"
ruby_add_rdepend ">=dev-ruby/rjb-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
