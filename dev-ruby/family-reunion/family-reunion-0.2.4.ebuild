# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An algorithm to merge related nodes of two taxonomic hierarchies with synonym information"
HOMEPAGE="http://github.com/GlobalNamesArchitecture/family-reunion"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dwc-archive-0.5.13"
ruby_add_rdepend ">=dev-ruby/taxamatch_rb-0.7.6"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.0"
ruby_add_rdepend ">=dev-ruby/rcov-0"
ruby_add_rdepend ">=dev-ruby/ruby-debug19-0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0"
ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"

