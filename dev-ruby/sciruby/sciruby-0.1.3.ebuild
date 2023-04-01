# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby has for some time had no equivalent to the beautifully constructed numpy, scipy, and matplotlib libraries for Python"
HOMEPAGE="http://sciruby.com"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/distribution-0.4.0"
ruby_add_rdepend ">=dev-ruby/green_shoes-1.0.282"
ruby_add_rdepend ">=dev-ruby/statsample-1.1.0"
ruby_add_rdepend ">=dev-ruby/integration-0"
ruby_add_rdepend ">=dev-ruby/minimization-0"
ruby_add_rdepend ">=dev-ruby/gsl-1.14.5"
ruby_add_rdepend ">=dev-ruby/rsvg2-1.0.0"
ruby_add_rdepend ">=dev-ruby/simpler-0.1.0"
ruby_add_rdepend ">=dev-ruby/rubyvis-0.4.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/coderay-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/redcloth-0"
ruby_add_rdepend ">=dev-ruby/ruby-gtksourceview-0"
ruby_add_rdepend ">=dev-ruby/shoulda-2.11"
ruby_add_rdepend ">=dev-ruby/hoe-gemspec-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-bundler-1.1"
ruby_add_rdepend ">=dev-ruby/minitest-2.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

