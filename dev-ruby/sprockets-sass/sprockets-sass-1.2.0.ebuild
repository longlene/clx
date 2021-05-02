# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="When using Sprockets 2"
HOMEPAGE="http://github.com/petebrowne/sprockets-sass"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sprockets-2.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.1"
ruby_add_rdepend ">=dev-ruby/appraisal-0.5"
ruby_add_rdepend ">=dev-ruby/rspec-2.13"
ruby_add_rdepend ">=dev-ruby/test_construct-2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.0"
ruby_add_rdepend ">=dev-ruby/sass-3.3"
ruby_add_rdepend ">=dev-ruby/compass-1.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

